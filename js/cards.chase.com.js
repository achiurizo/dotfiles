// Calculate the total activity cost
function totalActivityCost() {
  var total = 0;
  $('td.amount').each(function(i) {
    total += parseFloat($(this).text().replace("$",""))
  });
  return total;
}

$(document).ready(function(){
  setTimeout(function(){
    // console.log("Activity Total Cost: $" + totalActivityCost());
    var totalHtml = "<tr><td class=\"left\">Total Activity Cost:</td><td>$" + totalActivityCost().toFixed(2) + "</td></tr>"
    $('table.card-accountdetailcol > tbody:first > tr:nth-child(3)').after(totalHtml);
  }, 5000);
});
