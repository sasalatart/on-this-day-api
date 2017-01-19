export const months = [
  { value: 1, days: 31, label: 'January' },
  { value: 2, days: 29, label: 'February' },
  { value: 3, days: 31, label: 'March' },
  { value: 4, days: 30, label: 'April' },
  { value: 5, days: 31, label: 'May' },
  { value: 6, days: 30, label: 'June' },
  { value: 7, days: 31, label: 'July' },
  { value: 8, days: 31, label: 'August' },
  { value: 9, days: 30, label: 'September' },
  { value: 10, days: 31, label: 'October' },
  { value: 11, days: 30, label: 'November' },
  { value: 12, days: 31, label: 'December' }
];

let days = [];
for (let i = 1; i <= 31; i++) {
  days.push({ value: i, label: i });
}

export const possibleDaysForMonth = (monthIndex) => {
  const daysInMonth = months.find(month => {
    return month.value === monthIndex;
  }).days

  return days.slice(0, daysInMonth);
}

export const possibleMonthsForDay = (dayIndex) => {
  return months.filter(monthInfo => {
    return monthInfo.days >= dayIndex;
  });
}
