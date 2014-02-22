# Calculate the total activity cost for this payment period.
totalActivityCost = ()->
  total = 0
  $('td.amount').each () ->
    total += parseFloat $(this).text().replace('$','')
  return total

# Highlight rows that have high spending.
highlightRow = (amount)->
  $('td.amount').each () ->
    amount = parseFloat $(this).text().replace('$','')
    if amount >= 100.0
      $(this).parent().css("background-color", 'red')
    else if amount >= 50.0
      $(this).parent().css("background-color", 'orange')

# Add the Total to Menu
addTotalToMenu = ()->
  totalHtml = """
    <tr>
      <td class="left">Total Activity Cost:</td>
      <td>$#{totalActivityCost()}</td>
    </tr>
  """
  $('table.card-accountdetailcol > tbody:first > tr:nth-child(3)').after(totalHtml)

$(document).ready ()->
  setTimeout addTotalToMenu, 5000
  setTimeout highlightRow,   5000
