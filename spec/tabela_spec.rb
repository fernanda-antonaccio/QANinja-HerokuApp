
describe 'Tabelas', :tabela do

    before(:each) do
        visit '/tables'
    end

    it 'Deve exibir o salario do Stark', :stark do
        atores = all('table tbody tr')
        stark = atores.detect { |ator| ator.text.include?('Robert Downey Jr')}
        expect(stark.text).to include '10.000.000'
    end

    it 'Deve exibir o salario do Vin Diesel', :diesel do
        diesel = find('table tbody tr', text: '@vindiesel')
        expect(diesel).to have_content '10.000.000'
    end

    it 'Deve exibir o filme do Vin Diesel', :dieselFilme do
        diesel = find('table tbody tr', text: '@vindiesel')
        movie = diesel.all('td')[2].text
        expect(movie).to eql 'Velozes e Furiosos'
    end

    it 'Deve exibir o insta do Chris Evans', :evans do
        chris = find('table tbody tr', text: 'Chris Evans')
        insta = chris.all('td')[4].text
        expect(insta).to eql '@teamcevans'
    end

    it 'Deve selecionar Chris Prat para remoção', :pratRemove do
        prat = find('table tbody tr', text: 'Chris Prat')
        prat.find('a', text: 'delete').click

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'
    end

    it 'Deve selecionar Chris Prat para edição', :pratEdita do
        prat = find('table tbody tr', text: 'Chris Prat')
        prat.find('a', text: 'edit').click

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para edição!'
    end
end