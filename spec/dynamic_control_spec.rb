
describe 'Dynamic Control', :dynamic do 

    before(:each) do
        visit '/dynamic_controls'
    end

    it 'Habilita e Desabilita' do
        page.has_field? 'movie', disabled: true
        click_button 'Habilita'
        page.has_field? 'movie', disabled: false
        click_button 'Desabilita'
        page.has_field? 'movie', disabled: true
    end
end