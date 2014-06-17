# Calculate the total activity cost for this payment period.
totalActivityCost = ()->
  total = 0
  $('td.amount').each () ->
    total += parseFloat $(this).text().replace('$','')
  return total

bigPurchases    = 0
mediumPurchases = 0
otherPurchases  = 0

# Highlight rows that have high spending.
highlightRow = (amount)->
  bigPurchases    = 0
  mediumPurchases = 0
  otherPurchases  = 0
  $('td.amount').each () ->
    amount = parseFloat $(this).text().replace('$','')
    if amount >= 100.0
      bigPurchases += amount
      $(this).parent().css("background-color", 'red')
    else if amount >= 50.0
      mediumPurchases += amount
      $(this).parent().css("background-color", 'orange')
    else
      otherPurchases += amount

# Add the Total to Menu
addTotalToMenu = ()->
  $(".custom-totals").remove()
  totalHtml = """
    <tr class="custom-totals">
      <td class="left">Total Activity Cost:</td>
      <td>$#{totalActivityCost()}</td>
    </tr>
    <tr class="custom-totals">
      <td class="left">Total Big Purchases:</td>
      <td>$#{bigPurchases}</td>
    </tr>
    <tr class="custom-totals">
      <td class="left">Total Medium Purchases:</td>
      <td>$#{mediumPurchases}</td>
    </tr>
    <tr class="custom-totals">
      <td class="left">Total Other Purchases:</td>
      <td>$#{otherPurchases}</td>
    </tr>
  """
  $('table.card-accountdetailcol > tbody:first > tr:nth-child(3)').after(totalHtml)

$(document).ready ()->
  setTimeout addTotalToMenu, 7000
  setTimeout highlightRow,   5000

$("#StatementPeriodQuick").on 'change', ()->
  setTimeout addTotalToMenu, 7000
  setTimeout highlightRow,   5000

