'use strict';function a12_0x8895(_0x4d5e66,_0x5ec3a2){var _0x4db65f=a12_0x4db6();return a12_0x8895=function(_0x889578,_0x590e92){_0x889578=_0x889578-0x87;var _0x53f8be=_0x4db65f[_0x889578];return _0x53f8be;},a12_0x8895(_0x4d5e66,_0x5ec3a2);}var a12_0x53b43e=a12_0x8895;(function(_0x27e8f8,_0x56e3b0){var _0x5615bd=a12_0x8895,_0x4508d6=_0x27e8f8();while(!![]){try{var _0x4ae65b=-parseInt(_0x5615bd(0x89))/0x1+parseInt(_0x5615bd(0x98))/0x2*(parseInt(_0x5615bd(0x90))/0x3)+-parseInt(_0x5615bd(0x87))/0x4*(-parseInt(_0x5615bd(0x8c))/0x5)+parseInt(_0x5615bd(0x8e))/0x6+-parseInt(_0x5615bd(0x9d))/0x7+-parseInt(_0x5615bd(0x93))/0x8*(parseInt(_0x5615bd(0x95))/0x9)+parseInt(_0x5615bd(0x9b))/0xa*(parseInt(_0x5615bd(0x99))/0xb);if(_0x4ae65b===_0x56e3b0)break;else _0x4508d6['push'](_0x4508d6['shift']());}catch(_0x12963){_0x4508d6['push'](_0x4508d6['shift']());}}}(a12_0x4db6,0x901dd));Object[a12_0x53b43e(0x8d)](exports,a12_0x53b43e(0x8f),{'value':!![]});function _interopRequireDefault(_0x53a1dd){var _0x2d3221=a12_0x53b43e;return _0x53a1dd&&_0x53a1dd[_0x2d3221(0x8f)]?_0x53a1dd:{'default':_0x53a1dd};}var _sequelize=require('sequelize'),_sequelize2=_interopRequireDefault(_sequelize),_bcryptjs=require('bcryptjs'),_bcryptjs2=_interopRequireDefault(_bcryptjs);class User extends _sequelize[a12_0x53b43e(0x91)]{static[a12_0x53b43e(0x9e)](_0x5e7180){var _0xa1349a=a12_0x53b43e;return super['init']({'name':_sequelize2['default']['STRING'],'email':_sequelize2['default'][_0xa1349a(0x9c)],'password':_sequelize2[_0xa1349a(0x8b)][_0xa1349a(0x8a)],'password_hash':_sequelize2['default'][_0xa1349a(0x9c)],'provider':_sequelize2['default']['BOOLEAN']},{'sequelize':_0x5e7180}),this[_0xa1349a(0x9a)]('beforeSave',async _0x440280=>{var _0x4bf579=_0xa1349a;_0x440280['password']&&(_0x440280[_0x4bf579(0x96)]=await _bcryptjs2['default'][_0x4bf579(0x92)](_0x440280[_0x4bf579(0x88)],0x8));}),this;}[a12_0x53b43e(0x94)](_0x2384c9){var _0x524bea=a12_0x53b43e;return _bcryptjs2['default'][_0x524bea(0x97)](_0x2384c9,this['password_hash']);}}function a12_0x4db6(){var _0x30e80e=['3ohjPRX','Model','hash','16xSpueY','checkPassword','2489301joLOaF','password_hash','compare','1048694XhgLqb','921877WOjkji','addHook','20XYrrEP','STRING','5860589OOXkyX','init','4xqcfVP','password','64532tWiziS','VIRTUAL','default','5043725DpJocy','defineProperty','2067192WXkrYb','__esModule'];a12_0x4db6=function(){return _0x30e80e;};return a12_0x4db6();}exports['default']=User;