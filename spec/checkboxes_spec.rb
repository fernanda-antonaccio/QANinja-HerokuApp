
describe 'Caixa de Seleção', :checkboxes do

    before(:each) do
        visit '/checkboxes'
    end

    it 'Marcando Opções', :marcando do
        check('thor')
    end

    it 'Desmarcando Opções', :desmarcando do
        uncheck('antman')
    end

    it 'Marcando Opções com True', :marcando_true do
        find('input[value=iron-man]').set(true)
        find('input[value=the-avengers]').set(true)
    end

    it 'Desmarcando Opções com False', :desmarcando_false do
        find('input[value=guardians]').set(false)
        find('input[value=ant-man]').set(false)
    end
end