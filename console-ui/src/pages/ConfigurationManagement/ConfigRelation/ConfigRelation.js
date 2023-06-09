import React, { useState } from 'react';
import { Tree } from '@douyinfe/semi-ui';
import {
    ConfigProvider,
    Field,
  } from '@alifd/next';

import './index.scss';

可拖拽树形结构
@ConfigProvider.config
class ConfigRelation extends React.Component {
    static displayName = 'ConfigRelation';
    constructor(props) {
        super(props);
        this.field = new Field(this);
    }

    render() {
        const initialData = [
            {
                label: 'Asia',
                value: 'Asia',
                key: '0',
                children: [
                    {
                        label: 'China',
                        value: 'China',
                        key: '0-0',
                        children: [
                            {
                                label: 'Beijing',
                                value: 'Beijing',
                                key: '0-0-0',
                            },
                            {
                                label: 'Shanghai',
                                value: 'Shanghai',
                                key: '0-0-1',
                            },
                        ],
                    },
                    {
                        label: 'Japan',
                        value: 'Japan',
                        key: '0-1',
                        children: [
                            {
                                label: 'Osaka',
                                value: 'Osaka',
                                key: '0-1-0'
                            }
                        ]
                    },
                ],
            },
            {
                label: 'North America',
                value: 'North America',
                key: '1',
                children: [
                    {
                        label: 'United States',
                        value: 'United States',
                        key: '1-0'
                    },
                    {
                        label: 'Canada',
                        value: 'Canada',
                        key: '1-1'
                    }
                ]
            },
            {
                label: 'Europe',
                value: 'Europe',
                key: '2',
            }
        ];
        const [treeData, setTreeData] = useState(initialData);

        function onDrop(info) {
            const { dropToGap, node, dragNode } = info;
            const dropKey = node.key;
            const dragKey = dragNode.key;
            const dropPos = node.pos.split('-');
            const dropPosition = info.dropPosition - Number(dropPos[dropPos.length - 1]);
            const data = [...treeData];
            const loop = (data, key, callback) => {
                data.forEach((item, ind, arr) => {
                    if (item.key === key) return callback(item, ind, arr);
                    if (item.children) return loop(item.children, key, callback);
                });
            };
            let dragObj;
            loop(data, dragKey, (item, ind, arr) => {
                arr.splice(ind, 1);
                dragObj = item;
            });

            if (!dropToGap) {
                // inset into the dropPosition
                loop(data, dropKey, (item, ind, arr) => {
                    item.children = item.children || [];
                    item.children.push(dragObj);
                });
            } else if (dropPosition === 1 && node.children && node.expanded) {
                // has children && expanded and drop into the node bottom gap
                // insert to the top
                loop(data, dropKey, item => {
                    item.children = item.children || [];
                    item.children.unshift(dragObj);
                });
            } else {
                let dropNodeInd;
                let dropNodePosArr;
                loop(data, dropKey, (item, ind, arr) => {
                    dropNodePosArr = arr;
                    dropNodeInd = ind;
                });
                if (dropPosition === -1) {
                    // insert to top
                    dropNodePosArr.splice(dropNodeInd, 0, dragObj);
                } else {
                    // insert to bottom
                    dropNodePosArr.splice(dropNodeInd + 1, 0, dragObj);
                }
            }
            setTreeData(data);
        }
        return <Tree treeData={treeData} draggable onDrop={onDrop} />;
    }
}

// 简单文本
// @ConfigProvider.config
// class ConfigRelation extends React.Component {
//     static displayName = 'ConfigCompare';
//     constructor(props) {
//         super(props);
//         this.field = new Field(this);
//     }

//     render() {
//         return (
//             <div>asdf</div>
//         );
//     }
// }

// 简单树形
// @ConfigProvider.config
// class ConfigRelation extends React.Component {
//     static displayName = 'ConfigRelation';
//     constructor(props) {
//         super(props);
//         this.field = new Field(this);
//     }

//     render() {
//         const treeData = [
//             {
//                 label: '亚洲',
//                 value: 'Asia',
//                 key: '0',
//                 children: [
//                     {
//                         label: '中国',
//                         value: 'China',
//                         key: '0-0',
//                         children: [
//                             {
//                                 label: '北京',
//                                 value: 'Beijing',
//                                 key: '0-0-0',
//                             },
//                             {
//                                 label: '上海',
//                                 value: 'Shanghai',
//                                 key: '0-0-1',
//                             },
//                         ],
//                     },
//                 ],
//             },
//             {
//                 label: '北美洲',
//                 value: 'North America',
//                 key: '1',
//             }
//         ];
//         const style = {
//             width: 260,
//             height: 420,
//             border: '1px solid var(--semi-color-border)'
//         };
//         return (
//             <Tree
//                 treeData={treeData}
//                 defaultExpandAll
//                 style={style}
//             />
//         );
//     }
// }

export default ConfigRelation;
