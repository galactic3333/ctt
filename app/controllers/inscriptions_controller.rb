class InscriptionsController < ApplicationController
  def new
    @inscription = Inscription.new
  end

  def create
    @inscription = Inscription.new(inscription_params)
    @inscription.kind = 'Alumno'
    @inscription.user_id = current_user.id
    @inscription.save
    redirect_to root_path, alert: 'Registro al curso completo'
  end

  private
  def inscription_params
    params.require(:inscription).permit(:course_id)
  end
end
