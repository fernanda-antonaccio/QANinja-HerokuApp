
describe 'Dropdown List', :dropdown do 

    before(:each) do
        visit '/dropdown'
    end

    it 'Item especifico com dropdown', :dropdown_simples do
        select('Bruce Banner', from: 'dropdown')
    end

    it 'Item especifico com find', :dropdown_find do
        drop = find('.avenger-list')
        drop.find('option', text: 'Scott Lang').select_option
    end

    it 'Sorteia qualquer opção', :dropdown_sorteia do
        drop = find('.avenger-list')
        drop.all('option').sample.select_option
    end
end