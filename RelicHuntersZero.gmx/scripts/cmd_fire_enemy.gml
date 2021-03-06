///cmd_fire_enemy();
if instance_exists(owner)
{     
        fire_burst_current++;
        can_fire = false;
              
        repeat(fire_amount)
        {
            projectileX = x+(lengthdir_x(spawn_distance_from_barrel,shoot_direction));
            projectileY = y+(lengthdir_y(spawn_distance_from_barrel,shoot_direction));
            
            if (!is_rocket) projectile = instance_create(projectileX,projectileY,obj_projectile_enemy);
            else projectile = instance_create(projectileX,projectileY,obj_rocket);
            
            projectile.speed = projectile_speed;
            projectile.decay = projectile_speed_decay;
            projectile.range = projectile_range;
            projectile.push_power = projectile_power;
            projectile.ammo_type = ammo_type;
                        
            var precision;
            precision = random_range(-accuracy,accuracy);
            projectile.direction = shoot_direction+precision;
                        
            projectile.faction = f_enemy;
            projectile.type = shot_type;
            projectile.damage = projectile_damage;
            
            if (sound == 'pistol') 
            {
                if (fire_burst_current == 1) && (fire_burst > 1) audio_play(owner.audio_emitter,false,1,sfx_burstfire_start);
                audio_play(owner.audio_emitter,false,1,sfx_pistol,sfx_pistol,sfx_pistol);
            }
            if (sound = 'machinegun')
            {
                audio_play(owner.audio_emitter,false,1,sfx_burstfire_start);
                audio_play(owner.audio_emitter,false,1,sfx_pistol,sfx_pistol,sfx_pistol);
            }
            if (sound == 'shotgun') && (!audio_is_playing(sfx_shotgun)) audio_play(owner.audio_emitter,false,1,sfx_shotgun);
            if (sound == 'sniper') audio_play(owner.audio_emitter,false,1,sfx_sniper);
            if (sound = 'smg') audio_play(owner.audio_emitter,false,1,sfx_smg1,sfx_smg2,sfx_smg3,sfx_smg4,sfx_smg5);
            if (sound = 'rocket') audio_play(owner.audio_emitter,false,1,sfx_rocket_start);
            if (sound == 'rifle') 
            {
                if (fire_burst_current == 1) audio_play(owner.audio_emitter,false,1,sfx_burstfire_start);
                audio_play(owner.audio_emitter,false,1,sfx_rifle1,sfx_rifle2,sfx_rifle3);
            }
        }
        
        recoil_speed = 4;
        
        if (!is_rocket) && (global.count_casings < global.max_casings)
        {
            casing = instance_create(x,y+16,fx_casing);
            casing.direction = shoot_direction+180+random_range(casing.dirMin,casing.dirMax);
            casing.ammo_type = ammo_type;
        }
}