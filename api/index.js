const mostFrequentNames = require('./names');
const {json} = require('micro');

module.exports = async req => {
	const data = await json(req);
	console.log(data);

	return mostFrequentNames(data);
};

// module.exports = () => ({
//     date: new Date
//   })