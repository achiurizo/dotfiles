# Calculate the total activity cost for this payment period.
totalActivityCost = ()->
  total = 0
  $('td.amount').each (i) ->
    total += parseFloat $(this).text().replace('$','')
  return total

$(document).ready ()->
  setTimeout () ->
    totalHtml = """
      <tr>
        <td class="left">Total Activity Cost:</td>
        <td>$#{totalActivityCost()}</td>
      </tr>
    """
    $('table.card-accountdetailcol > tbody:first > tr:nth-child(3)').after(totalHtml)
  , 5000

