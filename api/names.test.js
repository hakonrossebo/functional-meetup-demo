const mostFrequentNames = require('./names');

test('Initial test', () => {
  expect(mostFrequentNames(['Ola ola ola', 'Kari', 'Ola', 'Petter'])[0]).toBe('ola (2)');
});