// Made with Amplify Shader Editor v1.9.8.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Polyart/Dreamscape/Water/River"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_WaterfallSteepnessLineSpeed("Waterfall Steepness Line Speed", Float) = 0.1
		_WaterfallSteepnessLineTexture("Waterfall Steepness Line Texture", 2D) = "white" {}
		_CloudNoiseSpeed("Cloud Noise Speed", Float) = -0.1
		_SteepVoronoiTexture("Steep Voronoi Texture", 2D) = "white" {}
		_CloudNoise("Cloud Noise", 2D) = "white" {}
		_SteepVoronoiStep("Steep Voronoi Step", Range( 0 , 1)) = 0.5
		_SteepVoronoiOpacity("Steep Voronoi Opacity", Range( 0 , 1)) = 0.5
		_SteepVoronoiSpeed("Steep Voronoi Speed", Float) = 0.2
		_ColorVariationSpeed("Color Variation Speed", Float) = -0.1
		_ColorVariationTexture("Color Variation Texture", 2D) = "white" {}
		_ColorVariationDepth("Color Variation Depth", Range( 0 , 1)) = 0.054
		_SteepVoronoiDistortion("Steep Voronoi Distortion", Range( 0 , 1)) = 0.05
		_Color3("Color 1", Color) = (0,0.8273995,1,0)
		_Color5("Color 3", Color) = (0,0.5989819,0.8867924,0)
		_Color4("Color 2", Color) = (0,0.5989819,0.8867924,0)
		_ColorVariationContrast("Color Variation Contrast", Float) = 1
		_WaterNormals("Water Normals", 2D) = "white" {}
		[HEADER(Basic Attributes)]_Refraction("Refraction", Range( 0 , 0.1)) = 0.0611961
		_NormalsSpeed("Normals Speed", Float) = 0
		_NormalsDistortionIntensity("Normals Distortion Intensity", Range( 0 , 0.2)) = 0.05
		_Smoothness("Smoothness", Range( 0 , 1)) = 1
		_NormalsStrength("Normals Strength", Range( 0 , 1)) = 0.2
		_ColorTransparencyDepthFar("Color Transparency  Depth Far", Float) = 1
		_ColorTransparencyDepthNear("Color Transparency  Depth Near", Float) = 1
		_EdgeFoamThickness("Edge Foam Thickness", Range( 0 , 0.5)) = 0.1
		_NoiseLinesPow("Noise Lines Pow", Float) = 1
		_NoiseLinesOpacity("Noise Lines Opacity", Float) = 0.8
		_EdgeFoamDepth("Edge Foam Depth", Range( 0 , 1)) = 0.9
		_EdgeFoamNoiseMultiplier("Edge Foam Noise Multiplier", Float) = 2
		_NoiseLinesReveal("Noise Lines Reveal", Float) = 0.8
		_NoiseLinesDistortion("Noise Lines Distortion", Range( 0 , 0.3)) = 0.042
		_EdgeFoamIntensity("Edge Foam Intensity", Float) = 1
		_EdgeFoamContrast("Edge Foam Contrast", Float) = 1
		_NoiseLinesSpeed("Noise Lines Speed", Float) = -0.2
		_NoiseLines("Noise Lines", 2D) = "white" {}
		_FoamTexture("Foam Texture", 2D) = "white" {}
		_FoamSpeed("Foam Speed", Float) = 0.2
		_FoamNormalDistortion("Foam Normal Distortion", Range( 0 , 1)) = 0.02282609
		_FoamHardness("Foam Hardness", Range( 0 , 1)) = 0.5
		_FoamLinesDistortionWaterfall("Foam Lines Distortion Waterfall", Range( 0 , 0.2)) = 0.05
		_FoamLinesDistortion("Foam Lines Distortion", Range( 0 , 0.2)) = 0.05
		_FoamLinesPowWaterfall("Foam Lines Pow Waterfall", Float) = 1
		_FoamLinesPow("Foam Lines Pow", Float) = 1
		_FoamLinesSpeed("Foam Lines Speed", Float) = 0.15
		_FoamLinesSpeedWaterfall("Foam Lines Speed Waterfall", Float) = 0.15
		_FoamLinesNumber("Foam Lines Number", Float) = 20
		_FoamLinesLengthWaterfall("Foam Lines Length Waterfall", Float) = 20
		_FoamLinesLength("Foam Lines Length", Float) = 20
		_FoamLinesWidthGradience("Foam Lines Width Gradience", Range( 0 , 1)) = 1
		_FoamLinesWidthGradienceWaterfall("Foam Lines Width Gradience Waterfall", Range( 0 , 1)) = 1
		_FoamLinesLengthGradience("Foam Lines Length Gradience", Range( 0 , 1)) = 1
		_FoamLinesMask("Foam Lines Mask", Range( 0 , 1)) = 0.5
		_FoamLinesMaskWaterfall("Foam Lines Mask Waterfall", Range( 0 , 1)) = 0.7623556
		_FoamLinesOpacity("Foam Lines Opacity", Range( 0 , 1)) = 0.5
		_FoamLinesWaterfall("Foam Lines Waterfall", Range( 0 , 1)) = 0.6530934
		_SlopeLinesStep("Slope LinesStep", Range( 0 , 1)) = 0.368
		_SlopeLinesOpacity("Slope Lines Opacity", Range( 0 , 1)) = 0.587
		_SteepWaterSmallDotsOpacity("Steep Water Small Dots Opacity", Range( 0 , 1)) = 0.5
		_FlatWaterSmallDotsOpacity("Flat Water Small Dots Opacity", Range( 0 , 1)) = 0.5
		_SteepWaterSmallDotsStep("Steep Water Small Dots Step", Range( 0 , 1)) = 0.88
		_FlatWaterSmallDotsStep("Flat Water Small Dots Step", Range( 0 , 1)) = 0.6
		_CausticsTexture("Caustics Texture", 2D) = "white" {}
		_CausticsSpeed("Caustics Speed", Float) = 0
		_CausticsViewOffset("Caustics View Offset", Float) = 0.05
		_CausticsOpacity("Caustics Opacity", Range( 0 , 1)) = 1
		_CausticsDepth("Caustics Depth", Float) = 2
		[Toggle(_DEBUG_ON)] _DEBUG("DEBUG", Float) = 0
		_DebugWaterColor("DebugWaterColor", Range( 0 , 1)) = 0
		_DebugNormals("DebugNormals", Range( 0 , 1)) = 0
		_DebugFlowLines("DebugFlowLines", Range( 0 , 1)) = 0
		_DebugEdgeFoam("DebugEdgeFoam", Range( 0 , 1)) = 0
		_DebugVoronoiFoam("DebugVoronoiFoam", Range( 0 , 1)) = 0
		_SteepWaterStartDeg("Steep Water Start Deg", Float) = 15
		_DebugCloudNoise("Debug Cloud Noise", Range( 0 , 1)) = 0
		_GlobalSpeed("Global Speed", Float) = 1
		_EdgeOpacityDistance("Edge Opacity Distance", Float) = 0.1
		_ColorMaxOpacity("Color Max Opacity", Range( 0 , 1)) = 1


		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1
		[HideInInspector][ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1
		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" "UniversalMaterialType"="Lit" }

		Cull Back
		ZWrite Off
		ZTest LEqual
		Offset 0 , 0
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForwardOnly" }

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			

			#define _NORMAL_DROPOFF_TS 1
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19801
			#define ASE_SRP_VERSION 140011
			#define REQUIRE_OPAQUE_TEXTURE 1
			#define REQUIRE_DEPTH_TEXTURE 1


			

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS

			
            #pragma multi_compile _ EVALUATE_SH_MIXED EVALUATE_SH_VERTEX
		

			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION

			

			
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
           

			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _LIGHT_COOKIES
			#pragma multi_compile _ _FORWARD_PLUS

			

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_FORWARD

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			
			#if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#pragma shader_feature_local _DEBUG_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				#if defined(ASE_FOG) || defined(_ADDITIONAL_LIGHTS_VERTEX)
					half4 fogFactorAndVertexLight : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _CausticsTexture_ST;
			float4 _SteepVoronoiTexture_ST;
			float4 _NoiseLines_ST;
			float4 _Color5;
			float4 _ColorVariationTexture_ST;
			float4 _WaterfallSteepnessLineTexture_ST;
			float4 _Color4;
			float4 _FoamTexture_ST;
			float4 _Color3;
			float4 _WaterNormals_ST;
			float4 _CloudNoise_ST;
			float _FoamLinesWidthGradienceWaterfall;
			float _FoamLinesWidthGradience;
			float _FoamLinesLengthGradience;
			float _FoamLinesWaterfall;
			float _SteepWaterSmallDotsStep;
			float _FlatWaterSmallDotsStep;
			float _FoamLinesMaskWaterfall;
			float _FoamLinesMask;
			float _SteepVoronoiSpeed;
			float _SteepVoronoiDistortion;
			float _SteepWaterSmallDotsOpacity;
			float _FoamLinesOpacity;
			float _FlatWaterSmallDotsOpacity;
			float _SteepWaterStartDeg;
			float _WaterfallSteepnessLineSpeed;
			float _FoamLinesSpeedWaterfall;
			float _SlopeLinesOpacity;
			float _SteepVoronoiStep;
			float _SteepVoronoiOpacity;
			float _CausticsDepth;
			float _CausticsOpacity;
			float _NormalsStrength;
			float _DebugWaterColor;
			float _DebugNormals;
			float _DebugFlowLines;
			float _DebugEdgeFoam;
			float _DebugVoronoiFoam;
			float _DebugCloudNoise;
			float _SlopeLinesStep;
			float _FoamLinesSpeed;
			float _FoamLinesDistortion;
			float _FoamLinesLength;
			float _CausticsSpeed;
			float _GlobalSpeed;
			float _CloudNoiseSpeed;
			float _CausticsViewOffset;
			float _NormalsSpeed;
			float _NormalsDistortionIntensity;
			float _Refraction;
			float _ColorVariationSpeed;
			float _ColorVariationDepth;
			float _ColorVariationContrast;
			float _NoiseLinesSpeed;
			float _NoiseLinesDistortion;
			float _NoiseLinesOpacity;
			float _NoiseLinesReveal;
			float _NoiseLinesPow;
			float _ColorTransparencyDepthNear;
			float _ColorTransparencyDepthFar;
			float _FoamLinesNumber;
			float _FoamLinesDistortionWaterfall;
			float _Smoothness;
			float _FoamLinesPowWaterfall;
			float _FoamLinesPow;
			float _FoamNormalDistortion;
			float _FoamLinesLengthWaterfall;
			float _FoamSpeed;
			float _EdgeFoamIntensity;
			float _EdgeFoamContrast;
			float _EdgeFoamNoiseMultiplier;
			float _EdgeFoamDepth;
			float _EdgeFoamThickness;
			float _ColorMaxOpacity;
			float _FoamHardness;
			float _EdgeOpacityDistance;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _CausticsTexture;
			sampler2D _CloudNoise;
			sampler2D _WaterNormals;
			sampler2D _ColorVariationTexture;
			sampler2D _NoiseLines;
			sampler2D _FoamTexture;
			sampler2D _SteepVoronoiTexture;
			sampler2D _WaterfallSteepnessLineTexture;


			inline float4 ASE_ComputeGrabScreenPos( float4 pos )
			{
				#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
				#else
				float scale = 1.0;
				#endif
				float4 o = pos;
				o.y = pos.w * 0.5f;
				o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
				return o;
			}
			
			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				output.ase_texcoord8.xy = input.texcoord.xy;
				output.ase_color = input.ase_color;
				output.ase_tangent = input.tangentOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord8.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif
				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( input.normalOS, input.tangentOS );

				output.tSpace0 = float4( normalInput.normalWS, vertexInput.positionWS.x );
				output.tSpace1 = float4( normalInput.tangentWS, vertexInput.positionWS.y );
				output.tSpace2 = float4( normalInput.bitangentWS, vertexInput.positionWS.z );

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV(input.texcoord1, unity_LightmapST, output.lightmapUVOrVertexSH.xy);
				#else
					OUTPUT_SH(normalInput.normalWS.xyz, output.lightmapUVOrVertexSH.xyz);
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					output.dynamicLightmapUV.xy = input.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					output.lightmapUVOrVertexSH.zw = input.texcoord.xy;
					output.lightmapUVOrVertexSH.xy = input.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				#if defined(ASE_FOG) || defined(_ADDITIONAL_LIGHTS_VERTEX)
					output.fogFactorAndVertexLight = 0;
					#if defined(ASE_FOG) && !defined(_FOG_FRAGMENT)
						output.fogFactorAndVertexLight.x = ComputeFogFactor(vertexInput.positionCS.z);
					#endif
					#ifdef _ADDITIONAL_LIGHTS_VERTEX
						half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );
						output.fogFactorAndVertexLight.yzw = vertexLight;
					#endif
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					output.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				output.positionCS = vertexInput.positionCS;
				output.clipPosV = vertexInput.positionCS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				output.texcoord = input.texcoord;
				output.texcoord1 = input.texcoord1;
				output.texcoord2 = input.texcoord2;
				output.ase_color = input.ase_color;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				output.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				output.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				output.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag ( PackedVaryings input
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (input.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( input.tSpace0.xyz );
					float3 WorldTangent = input.tSpace1.xyz;
					float3 WorldBiTangent = input.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(input.tSpace0.w,input.tSpace1.w,input.tSpace2.w);
				float3 WorldViewDirection = GetWorldSpaceNormalizeViewDir( WorldPosition );
				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = input.clipPosV;
				float4 ScreenPos = ComputeScreenPos( input.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(input.positionCS);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = input.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif

				float2 uv_CausticsTexture = input.ase_texcoord8.xy * _CausticsTexture_ST.xy + _CausticsTexture_ST.zw;
				float Global_Speed903 = _GlobalSpeed;
				float mulTime714 = _TimeParameters.x * ( _CausticsSpeed * Global_Speed903 );
				float2 appendResult715 = (float2(0.0 , mulTime714));
				float2 uv_CloudNoise = input.ase_texcoord8.xy * _CloudNoise_ST.xy + _CloudNoise_ST.zw;
				float mulTime793 = _TimeParameters.x * ( _CloudNoiseSpeed * Global_Speed903 );
				float2 appendResult796 = (float2(0.0 , mulTime793));
				float4 Cloud_Noise473 = tex2D( _CloudNoise, ( uv_CloudNoise + appendResult796 ) );
				float3 Caustics811 = tex2D( _CausticsTexture, ( uv_CausticsTexture + appendResult715 + ( (Cloud_Noise473).rg * _CausticsViewOffset ) ) ).rgb;
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ScreenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float4 fetchOpaqueVal194 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ase_grabScreenPosNorm.xy.xy ), 1.0 );
				float2 uv_WaterNormals = input.ase_texcoord8.xy * _WaterNormals_ST.xy + _WaterNormals_ST.zw;
				float mulTime823 = _TimeParameters.x * ( Global_Speed903 * _NormalsSpeed );
				float2 appendResult824 = (float2(0.0 , mulTime823));
				float4 Normals205 = tex2D( _WaterNormals, ( uv_WaterNormals + appendResult824 + ( (Cloud_Noise473).rb * _NormalsDistortionIntensity ) ) );
				float3 unpack289 = UnpackNormalScale( Normals205, _Refraction );
				unpack289.z = lerp( 1, unpack289.z, saturate(_Refraction) );
				float4 temp_output_203_0 = ( ase_grabScreenPosNorm + float4( unpack289 , 0.0 ) );
				float4 fetchOpaqueVal290 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_203_0.xy.xy ), 1.0 );
				float ase_depthLinearEye = LinearEyeDepth( ScreenPos.z / ScreenPos.w, _ZBufferParams );
				float depthEye292 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( temp_output_203_0.xy ) * ( _ProjectionParams.z - _ProjectionParams.y );
				float4 lerpResult291 = lerp( fetchOpaqueVal194 , fetchOpaqueVal290 , step( ase_depthLinearEye , depthEye292 ));
				float3 Refracted_Background801 = (lerpResult291).rgb;
				float2 uv_ColorVariationTexture = input.ase_texcoord8.xy * _ColorVariationTexture_ST.xy + _ColorVariationTexture_ST.zw;
				float mulTime775 = _TimeParameters.x * ( _ColorVariationSpeed * Global_Speed903 );
				float2 appendResult777 = (float2(0.0 , mulTime775));
				float2 temp_output_778_0 = ( uv_ColorVariationTexture + appendResult777 );
				float4 tex2DNode780 = tex2D( _ColorVariationTexture, temp_output_778_0 );
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 ase_viewVectorTS =  tanToWorld0 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).x + tanToWorld1 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).y  + tanToWorld2 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).z;
				float3 normalizeResult782 = normalize( ase_viewVectorTS );
				float2 paralaxOffset783 = ParallaxOffset( tex2DNode780.g , _ColorVariationDepth , normalizeResult782 );
				float3 lerpResult767 = lerp( _Color4.rgb , _Color3.rgb , pow( tex2D( _ColorVariationTexture, ( paralaxOffset783 + temp_output_778_0 ) ).g , _ColorVariationContrast ));
				float2 uv_NoiseLines = input.ase_texcoord8.xy * _NoiseLines_ST.xy + _NoiseLines_ST.zw;
				float mulTime751 = _TimeParameters.x * ( _NoiseLinesSpeed * Global_Speed903 );
				float2 appendResult755 = (float2(0.0 , mulTime751));
				float3 lerpResult770 = lerp( lerpResult767 , _Color5.rgb , pow( saturate( ( tex2D( _NoiseLines, ( uv_NoiseLines + appendResult755 + ( (Cloud_Noise473).rg * _NoiseLinesDistortion ) ) ).g * _NoiseLinesOpacity * pow( tex2DNode780.g , _NoiseLinesReveal ) ) ) , _NoiseLinesPow ));
				float3 Water_Color788 = lerpResult770;
				float4 ase_positionSSNorm = ScreenPos / ScreenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float depthLinearEye185 = LinearEyeDepth( SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_positionSSNorm.xy ), _ZBufferParams );
				float Scene_Depth206 = ( depthLinearEye185 - ScreenPos.w );
				float smoothstepResult542 = smoothstep( _ColorTransparencyDepthNear , _ColorTransparencyDepthFar , Scene_Depth206);
				float3 lerpResult197 = lerp( Refracted_Background801 , Water_Color788 , min( smoothstepResult542 , _ColorMaxOpacity ));
				float2 texCoord231 = input.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float EdgeMask236 = ( abs( ( texCoord231.x - 0.5 ) ) * 2.0 );
				float smoothstepResult261 = smoothstep( 0.0 , _EdgeFoamThickness , abs( ( EdgeMask236 - _EdgeFoamDepth ) ));
				float Edge_Foam325 = ( pow( saturate( ( ( (Cloud_Noise473).r - 1.0 ) + ( ( 1.0 - smoothstepResult261 ) * _EdgeFoamNoiseMultiplier ) ) ) , _EdgeFoamContrast ) * _EdgeFoamIntensity );
				float2 uv_FoamTexture = input.ase_texcoord8.xy * _FoamTexture_ST.xy + _FoamTexture_ST.zw;
				float mulTime301 = _TimeParameters.x * ( Global_Speed903 * -_FoamSpeed );
				float2 appendResult302 = (float2(0.0 , mulTime301));
				float3 unpack309 = UnpackNormalScale( Normals205, _FoamNormalDistortion );
				unpack309.z = lerp( 1, unpack309.z, saturate(_FoamNormalDistortion) );
				float2 appendResult321 = (float2(-unpack309.x , 0.0));
				float Painted_Foam323 = step( _FoamHardness , ( ( tex2D( _FoamTexture, ( uv_FoamTexture + ( float2( 0,0 ) + appendResult302 ) + appendResult321 ) ).r - 1.0 ) + input.ase_color.r ) );
				float3 objToWorldDir589 = normalize( mul( GetObjectToWorldMatrix(), float4( input.ase_tangent.xyz, 0.0 ) ).xyz );
				float SlopeInDeg29 = ( saturate( -objToWorldDir589.y ) * 90.0 );
				float smoothstepResult444 = smoothstep( 60.0 , 75.0 , SlopeInDeg29);
				float Waterfall_Mask445 = smoothstepResult444;
				float lerpResult459 = lerp( _FoamLinesPow , _FoamLinesPowWaterfall , Waterfall_Mask445);
				float temp_output_1_0_g18 = lerpResult459;
				float2 texCoord401 = input.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord331 = input.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult447 = lerp( _FoamLinesDistortion , _FoamLinesDistortionWaterfall , Waterfall_Mask445);
				float2 appendResult335 = (float2(( (Cloud_Noise473).r * lerpResult447 ) , 0.0));
				float2 temp_output_332_0 = ( texCoord331 + appendResult335 );
				float2 temp_cast_7 = (( ( 0.0 / _FoamLinesNumber ) * 0.5 )).xx;
				float temp_output_392_0 = sin( (floor( ( ( temp_output_332_0 - temp_cast_7 ) * _FoamLinesNumber ) )).x );
				float temp_output_393_0 = frac( ( temp_output_392_0 * 2357.156 ) );
				float temp_output_557_0 = step( 15.0 , SlopeInDeg29 );
				float lerpResult623 = lerp( _FoamLinesLength , _FoamLinesLengthWaterfall , temp_output_557_0);
				float lerpResult547 = lerp( _FoamLinesSpeed , ( _FoamLinesSpeed * _FoamLinesSpeedWaterfall ) , temp_output_557_0);
				float mulTime407 = _TimeParameters.x * ( ( (0.5 + (frac( ( temp_output_392_0 * 845.2346 ) ) - 0.0) * (1.5 - 0.5) / (1.0 - 0.0)) * ( _FoamLinesSpeed * lerpResult547 ) ) * Global_Speed903 );
				float temp_output_420_0 = ( ( ( temp_output_393_0 - 0.5 ) * 2.0 ) * 0.5 );
				float lerpResult462 = lerp( _FoamLinesMask , _FoamLinesMaskWaterfall , temp_output_557_0);
				float lerpResult455 = lerp( _FoamLinesWidthGradience , _FoamLinesWidthGradienceWaterfall , temp_output_557_0);
				float smoothstepResult443 = smoothstep( lerpResult455 , 1.0 , ( 1.0 - (abs( ( frac( ( temp_output_332_0 * _FoamLinesNumber ) ) - float2( 0.5,0.5 ) ) )).x ));
				float lerpResult7_g18 = lerp( ( 0.0 - temp_output_1_0_g18 ) , ( temp_output_1_0_g18 + 0.0 ) , ( pow( ( ( saturate( ( sin( ( ( ( texCoord401.y + 0.0 ) * (( lerpResult623 * 0.8 ) + (temp_output_393_0 - 0.0) * (( lerpResult623 * 1.2 ) - ( lerpResult623 * 0.8 )) / (1.0 - 0.0)) ) - mulTime407 ) ) - temp_output_420_0 ) ) * ( 1.0 / ( 1.0 - temp_output_420_0 ) ) ) * step( lerpResult462 , frac( ( temp_output_392_0 * 748.462 ) ) ) ) , _FoamLinesLengthGradience ) * smoothstepResult443 ));
				float clampResult8_g18 = clamp( lerpResult7_g18 , 0.0 , 1.0 );
				float smoothstepResult567 = smoothstep( 60.0 , 75.0 , SlopeInDeg29);
				float lerpResult569 = lerp( _FoamLinesOpacity , _FoamLinesWaterfall , temp_output_557_0);
				float Foam_Lines441 = ( saturate( ( saturate( clampResult8_g18 ) * ( abs( ( SlopeInDeg29 - 15.0 ) ) * 0.2 ) * ( 1.0 - smoothstepResult567 ) ) ) * lerpResult569 );
				float smoothstepResult615 = smoothstep( _SteepWaterStartDeg , ( _SteepWaterStartDeg + 5.0 ) , SlopeInDeg29);
				float lerpResult617 = lerp( _SteepWaterSmallDotsStep , _FlatWaterSmallDotsStep , smoothstepResult615);
				float2 uv_SteepVoronoiTexture = input.ase_texcoord8.xy * _SteepVoronoiTexture_ST.xy + _SteepVoronoiTexture_ST.zw;
				float mulTime69 = _TimeParameters.x * -( _SteepVoronoiSpeed * Global_Speed903 );
				float2 appendResult70 = (float2(0.0 , mulTime69));
				float Voronoi597 = tex2D( _SteepVoronoiTexture, ( uv_SteepVoronoiTexture + appendResult70 + ( _SteepVoronoiDistortion * (Cloud_Noise473).gb ) ) ).r;
				float lerpResult888 = lerp( _SteepWaterSmallDotsOpacity , _FlatWaterSmallDotsOpacity , smoothstepResult615);
				float Steep_Water_Small_Dots620 = ( step( lerpResult617 , Voronoi597 ) * lerpResult888 );
				float2 uv_WaterfallSteepnessLineTexture = input.ase_texcoord8.xy * _WaterfallSteepnessLineTexture_ST.xy + _WaterfallSteepnessLineTexture_ST.zw;
				float mulTime44 = _TimeParameters.x * ( -_WaterfallSteepnessLineSpeed * Global_Speed903 );
				float2 appendResult45 = (float2(0.0 , mulTime44));
				float WaterfallSteepLinesTex816 = tex2D( _WaterfallSteepnessLineTexture, ( uv_WaterfallSteepnessLineTexture + appendResult45 ) ).r;
				float Slope_Lines583 = ( step( _SlopeLinesStep , ( WaterfallSteepLinesTex816 * ( 1.0 - ( abs( ( SlopeInDeg29 - _SteepWaterStartDeg ) ) * 0.2 ) ) ) ) * _SlopeLinesOpacity );
				float smoothstepResult76 = smoothstep( ( _SteepWaterStartDeg - 5.0 ) , _SteepWaterStartDeg , SlopeInDeg29);
				float Steep_Voronoi850 = saturate( ( step( _SteepVoronoiStep , ( Voronoi597 * smoothstepResult76 ) ) * _SteepVoronoiOpacity ) );
				float3 lerpResult241 = lerp( lerpResult197 , float3( 1,1,1 ) , ( Edge_Foam325 + Painted_Foam323 + Foam_Lines441 + Steep_Water_Small_Dots620 + Slope_Lines583 + Steep_Voronoi850 ));
				float3 blendOpSrc730 = Caustics811;
				float3 blendOpDest730 = lerpResult241;
				float smoothstepResult741 = smoothstep( _CausticsDepth , 0.0 , Scene_Depth206);
				float Caustics_Alpha812 = saturate( ( smoothstepResult741 * _CausticsOpacity ) );
				float3 lerpBlendMode730 = lerp(blendOpDest730,( 1.0 - ( 1.0 - blendOpSrc730 ) * ( 1.0 - blendOpDest730 ) ),Caustics_Alpha812);
				float3 temp_cast_8 = (0.0).xxx;
				#ifdef _DEBUG_ON
				float3 staticSwitch855 = temp_cast_8;
				#else
				float3 staticSwitch855 = ( saturate( lerpBlendMode730 ));
				#endif
				
				float3 unpack177 = UnpackNormalScale( Normals205, _NormalsStrength );
				unpack177.z = lerp( 1, unpack177.z, saturate(_NormalsStrength) );
				float3 Final_Normals808 = unpack177;
				#ifdef _DEBUG_ON
				float3 staticSwitch856 = float3(0,0,1);
				#else
				float3 staticSwitch856 = Final_Normals808;
				#endif
				
				float4 temp_cast_10 = (0.0).xxxx;
				#ifdef _DEBUG_ON
				float4 staticSwitch868 = ( float4( ( Water_Color788 * _DebugWaterColor ) , 0.0 ) + ( Normals205 * _DebugNormals ) + ( Foam_Lines441 * _DebugFlowLines ) + ( Edge_Foam325 * _DebugEdgeFoam ) + ( ( Steep_Voronoi850 + Steep_Water_Small_Dots620 ) * _DebugVoronoiFoam ) + ( Cloud_Noise473 * _DebugCloudNoise ) );
				#else
				float4 staticSwitch868 = temp_cast_10;
				#endif
				
				#ifdef _DEBUG_ON
				float staticSwitch857 = 0.0;
				#else
				float staticSwitch857 = _Smoothness;
				#endif
				
				float smoothstepResult834 = smoothstep( 0.0 , _EdgeOpacityDistance , ( 1.0 - EdgeMask236 ));
				float Opacity839 = max( saturate( Edge_Foam325 ) , min( saturate( ( Scene_Depth206 / _EdgeOpacityDistance ) ) , smoothstepResult834 ) );
				#ifdef _DEBUG_ON
				float staticSwitch859 = 1.0;
				#else
				float staticSwitch859 = Opacity839;
				#endif
				

				float3 BaseColor = staticSwitch855;
				float3 Normal = staticSwitch856;
				float3 Emission = staticSwitch868.rgb;
				float3 Specular = 0.5;
				float Metallic = 0;
				float Smoothness = staticSwitch857;
				float Occlusion = 1;
				float Alpha = staticSwitch859;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = input.positionCS.z;
				#endif

				#ifdef _CLEARCOAT
					float CoatMask = 0;
					float CoatSmoothness = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.positionCS = input.positionCS;
				inputData.viewDirectionWS = WorldViewDirection;

				#ifdef _NORMALMAP
						#if _NORMAL_DROPOFF_TS
							inputData.normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent, WorldBiTangent, WorldNormal));
						#elif _NORMAL_DROPOFF_OS
							inputData.normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							inputData.normalWS = Normal;
						#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					inputData.shadowCoord = ShadowCoords;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					inputData.shadowCoord = TransformWorldToShadowCoord(inputData.positionWS);
				#else
					inputData.shadowCoord = float4(0, 0, 0, 0);
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = InitializeInputDataFog(float4(inputData.positionWS, 1.0), input.fogFactorAndVertexLight.x);
				#endif
				#ifdef _ADDITIONAL_LIGHTS_VERTEX
					inputData.vertexLighting = input.fogFactorAndVertexLight.yzw;
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = input.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(input.lightmapUVOrVertexSH.xy, input.dynamicLightmapUV.xy, SH, inputData.normalWS);
				#else
					inputData.bakedGI = SAMPLE_GI(input.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(input.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = input.dynamicLightmapUV.xy;
					#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = input.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				SurfaceData surfaceData;
				surfaceData.albedo              = BaseColor;
				surfaceData.metallic            = saturate(Metallic);
				surfaceData.specular            = Specular;
				surfaceData.smoothness          = saturate(Smoothness),
				surfaceData.occlusion           = Occlusion,
				surfaceData.emission            = Emission,
				surfaceData.alpha               = saturate(Alpha);
				surfaceData.normalTS            = Normal;
				surfaceData.clearCoatMask       = 0;
				surfaceData.clearCoatSmoothness = 1;

				#ifdef _CLEARCOAT
					surfaceData.clearCoatMask       = saturate(CoatMask);
					surfaceData.clearCoatSmoothness = saturate(CoatSmoothness);
				#endif

				#ifdef _DBUFFER
					ApplyDecalToSurfaceData(input.positionCS, surfaceData, inputData);
				#endif

				#ifdef _ASE_LIGHTING_SIMPLE
					half4 color = UniversalFragmentBlinnPhong( inputData, surfaceData);
				#else
					half4 color = UniversalFragmentPBR( inputData, surfaceData);
				#endif

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;

					#define SUM_LIGHT_TRANSMISSION(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 transmission = max( 0, -dot( inputData.normalWS, Light.direction ) ) * atten * Transmission;\
						color.rgb += BaseColor * transmission;

					SUM_LIGHT_TRANSMISSION( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS, inputData.shadowMask);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSMISSION( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS, inputData.shadowMask);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSMISSION( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#define SUM_LIGHT_TRANSLUCENCY(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 lightDir = Light.direction + inputData.normalWS * normal;\
						half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );\
						half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;\
						color.rgb += BaseColor * translucency * strength;

					SUM_LIGHT_TRANSLUCENCY( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS, inputData.shadowMask);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSLUCENCY( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS, inputData.shadowMask);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSLUCENCY( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_REFRACTION
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal,0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3(0,0,0), inputData.fogCoord);
					#else
						color.rgb = MixFog(color.rgb, inputData.fogCoord);
					#endif
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM

			

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19801
			#define ASE_SRP_VERSION 140011
			#define REQUIRE_DEPTH_TEXTURE 1


			

			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#pragma shader_feature_local _DEBUG_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float3 positionWS : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _CausticsTexture_ST;
			float4 _SteepVoronoiTexture_ST;
			float4 _NoiseLines_ST;
			float4 _Color5;
			float4 _ColorVariationTexture_ST;
			float4 _WaterfallSteepnessLineTexture_ST;
			float4 _Color4;
			float4 _FoamTexture_ST;
			float4 _Color3;
			float4 _WaterNormals_ST;
			float4 _CloudNoise_ST;
			float _FoamLinesWidthGradienceWaterfall;
			float _FoamLinesWidthGradience;
			float _FoamLinesLengthGradience;
			float _FoamLinesWaterfall;
			float _SteepWaterSmallDotsStep;
			float _FlatWaterSmallDotsStep;
			float _FoamLinesMaskWaterfall;
			float _FoamLinesMask;
			float _SteepVoronoiSpeed;
			float _SteepVoronoiDistortion;
			float _SteepWaterSmallDotsOpacity;
			float _FoamLinesOpacity;
			float _FlatWaterSmallDotsOpacity;
			float _SteepWaterStartDeg;
			float _WaterfallSteepnessLineSpeed;
			float _FoamLinesSpeedWaterfall;
			float _SlopeLinesOpacity;
			float _SteepVoronoiStep;
			float _SteepVoronoiOpacity;
			float _CausticsDepth;
			float _CausticsOpacity;
			float _NormalsStrength;
			float _DebugWaterColor;
			float _DebugNormals;
			float _DebugFlowLines;
			float _DebugEdgeFoam;
			float _DebugVoronoiFoam;
			float _DebugCloudNoise;
			float _SlopeLinesStep;
			float _FoamLinesSpeed;
			float _FoamLinesDistortion;
			float _FoamLinesLength;
			float _CausticsSpeed;
			float _GlobalSpeed;
			float _CloudNoiseSpeed;
			float _CausticsViewOffset;
			float _NormalsSpeed;
			float _NormalsDistortionIntensity;
			float _Refraction;
			float _ColorVariationSpeed;
			float _ColorVariationDepth;
			float _ColorVariationContrast;
			float _NoiseLinesSpeed;
			float _NoiseLinesDistortion;
			float _NoiseLinesOpacity;
			float _NoiseLinesReveal;
			float _NoiseLinesPow;
			float _ColorTransparencyDepthNear;
			float _ColorTransparencyDepthFar;
			float _FoamLinesNumber;
			float _FoamLinesDistortionWaterfall;
			float _Smoothness;
			float _FoamLinesPowWaterfall;
			float _FoamLinesPow;
			float _FoamNormalDistortion;
			float _FoamLinesLengthWaterfall;
			float _FoamSpeed;
			float _EdgeFoamIntensity;
			float _EdgeFoamContrast;
			float _EdgeFoamNoiseMultiplier;
			float _EdgeFoamDepth;
			float _EdgeFoamThickness;
			float _ColorMaxOpacity;
			float _FoamHardness;
			float _EdgeOpacityDistance;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _CloudNoise;


			
			float3 _LightDirection;
			float3 _LightPosition;

			PackedVaryings VertexFunction( Attributes input )
			{
				PackedVaryings output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				output.ase_texcoord3.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;

				float3 positionWS = TransformObjectToWorld( input.positionOS.xyz );
				float3 normalWS = TransformObjectToWorldDir(input.normalOS);

				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
					float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
					float3 lightDirectionWS = _LightDirection;
				#endif

				float4 positionCS = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

				#if UNITY_REVERSED_Z
					positionCS.z = min(positionCS.z, UNITY_NEAR_CLIP_VALUE);
				#else
					positionCS.z = max(positionCS.z, UNITY_NEAR_CLIP_VALUE);
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					output.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				output.positionCS = positionCS;
				output.clipPosV = positionCS;
				output.positionWS = positionWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_texcoord = input.ase_texcoord;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(	PackedVaryings input
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( input );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				float3 WorldPosition = input.positionWS;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = input.clipPosV;
				float4 ScreenPos = ComputeScreenPos( input.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = input.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_CloudNoise = input.ase_texcoord3.xy * _CloudNoise_ST.xy + _CloudNoise_ST.zw;
				float Global_Speed903 = _GlobalSpeed;
				float mulTime793 = _TimeParameters.x * ( _CloudNoiseSpeed * Global_Speed903 );
				float2 appendResult796 = (float2(0.0 , mulTime793));
				float4 Cloud_Noise473 = tex2D( _CloudNoise, ( uv_CloudNoise + appendResult796 ) );
				float2 texCoord231 = input.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float EdgeMask236 = ( abs( ( texCoord231.x - 0.5 ) ) * 2.0 );
				float smoothstepResult261 = smoothstep( 0.0 , _EdgeFoamThickness , abs( ( EdgeMask236 - _EdgeFoamDepth ) ));
				float Edge_Foam325 = ( pow( saturate( ( ( (Cloud_Noise473).r - 1.0 ) + ( ( 1.0 - smoothstepResult261 ) * _EdgeFoamNoiseMultiplier ) ) ) , _EdgeFoamContrast ) * _EdgeFoamIntensity );
				float4 ase_positionSSNorm = ScreenPos / ScreenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float depthLinearEye185 = LinearEyeDepth( SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_positionSSNorm.xy ), _ZBufferParams );
				float Scene_Depth206 = ( depthLinearEye185 - ScreenPos.w );
				float smoothstepResult834 = smoothstep( 0.0 , _EdgeOpacityDistance , ( 1.0 - EdgeMask236 ));
				float Opacity839 = max( saturate( Edge_Foam325 ) , min( saturate( ( Scene_Depth206 / _EdgeOpacityDistance ) ) , smoothstepResult834 ) );
				#ifdef _DEBUG_ON
				float staticSwitch859 = 1.0;
				#else
				float staticSwitch859 = Opacity839;
				#endif
				

				float Alpha = staticSwitch859;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = input.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask R
			AlphaToMask Off

			HLSLPROGRAM

			

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19801
			#define ASE_SRP_VERSION 140011
			#define REQUIRE_DEPTH_TEXTURE 1


			

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_DEPTHONLY

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#pragma shader_feature_local _DEBUG_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float3 positionWS : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _CausticsTexture_ST;
			float4 _SteepVoronoiTexture_ST;
			float4 _NoiseLines_ST;
			float4 _Color5;
			float4 _ColorVariationTexture_ST;
			float4 _WaterfallSteepnessLineTexture_ST;
			float4 _Color4;
			float4 _FoamTexture_ST;
			float4 _Color3;
			float4 _WaterNormals_ST;
			float4 _CloudNoise_ST;
			float _FoamLinesWidthGradienceWaterfall;
			float _FoamLinesWidthGradience;
			float _FoamLinesLengthGradience;
			float _FoamLinesWaterfall;
			float _SteepWaterSmallDotsStep;
			float _FlatWaterSmallDotsStep;
			float _FoamLinesMaskWaterfall;
			float _FoamLinesMask;
			float _SteepVoronoiSpeed;
			float _SteepVoronoiDistortion;
			float _SteepWaterSmallDotsOpacity;
			float _FoamLinesOpacity;
			float _FlatWaterSmallDotsOpacity;
			float _SteepWaterStartDeg;
			float _WaterfallSteepnessLineSpeed;
			float _FoamLinesSpeedWaterfall;
			float _SlopeLinesOpacity;
			float _SteepVoronoiStep;
			float _SteepVoronoiOpacity;
			float _CausticsDepth;
			float _CausticsOpacity;
			float _NormalsStrength;
			float _DebugWaterColor;
			float _DebugNormals;
			float _DebugFlowLines;
			float _DebugEdgeFoam;
			float _DebugVoronoiFoam;
			float _DebugCloudNoise;
			float _SlopeLinesStep;
			float _FoamLinesSpeed;
			float _FoamLinesDistortion;
			float _FoamLinesLength;
			float _CausticsSpeed;
			float _GlobalSpeed;
			float _CloudNoiseSpeed;
			float _CausticsViewOffset;
			float _NormalsSpeed;
			float _NormalsDistortionIntensity;
			float _Refraction;
			float _ColorVariationSpeed;
			float _ColorVariationDepth;
			float _ColorVariationContrast;
			float _NoiseLinesSpeed;
			float _NoiseLinesDistortion;
			float _NoiseLinesOpacity;
			float _NoiseLinesReveal;
			float _NoiseLinesPow;
			float _ColorTransparencyDepthNear;
			float _ColorTransparencyDepthFar;
			float _FoamLinesNumber;
			float _FoamLinesDistortionWaterfall;
			float _Smoothness;
			float _FoamLinesPowWaterfall;
			float _FoamLinesPow;
			float _FoamNormalDistortion;
			float _FoamLinesLengthWaterfall;
			float _FoamSpeed;
			float _EdgeFoamIntensity;
			float _EdgeFoamContrast;
			float _EdgeFoamNoiseMultiplier;
			float _EdgeFoamDepth;
			float _EdgeFoamThickness;
			float _ColorMaxOpacity;
			float _FoamHardness;
			float _EdgeOpacityDistance;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _CloudNoise;


			
			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				output.ase_texcoord3.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					output.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				output.positionCS = vertexInput.positionCS;
				output.clipPosV = vertexInput.positionCS;
				output.positionWS = vertexInput.positionWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_texcoord = input.ase_texcoord;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(	PackedVaryings input
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				float3 WorldPosition = input.positionWS;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = input.clipPosV;
				float4 ScreenPos = ComputeScreenPos( input.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = input.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_CloudNoise = input.ase_texcoord3.xy * _CloudNoise_ST.xy + _CloudNoise_ST.zw;
				float Global_Speed903 = _GlobalSpeed;
				float mulTime793 = _TimeParameters.x * ( _CloudNoiseSpeed * Global_Speed903 );
				float2 appendResult796 = (float2(0.0 , mulTime793));
				float4 Cloud_Noise473 = tex2D( _CloudNoise, ( uv_CloudNoise + appendResult796 ) );
				float2 texCoord231 = input.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float EdgeMask236 = ( abs( ( texCoord231.x - 0.5 ) ) * 2.0 );
				float smoothstepResult261 = smoothstep( 0.0 , _EdgeFoamThickness , abs( ( EdgeMask236 - _EdgeFoamDepth ) ));
				float Edge_Foam325 = ( pow( saturate( ( ( (Cloud_Noise473).r - 1.0 ) + ( ( 1.0 - smoothstepResult261 ) * _EdgeFoamNoiseMultiplier ) ) ) , _EdgeFoamContrast ) * _EdgeFoamIntensity );
				float4 ase_positionSSNorm = ScreenPos / ScreenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float depthLinearEye185 = LinearEyeDepth( SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_positionSSNorm.xy ), _ZBufferParams );
				float Scene_Depth206 = ( depthLinearEye185 - ScreenPos.w );
				float smoothstepResult834 = smoothstep( 0.0 , _EdgeOpacityDistance , ( 1.0 - EdgeMask236 ));
				float Opacity839 = max( saturate( Edge_Foam325 ) , min( saturate( ( Scene_Depth206 / _EdgeOpacityDistance ) ) , smoothstepResult834 ) );
				#ifdef _DEBUG_ON
				float staticSwitch859 = 1.0;
				#else
				float staticSwitch859 = Opacity839;
				#endif
				

				float Alpha = staticSwitch859;
				float AlphaClipThreshold = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = input.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19801
			#define ASE_SRP_VERSION 140011
			#define REQUIRE_OPAQUE_TEXTURE 1
			#define REQUIRE_DEPTH_TEXTURE 1

			#pragma shader_feature EDITOR_VISUALIZATION

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _DEBUG_ON


			struct Attributes
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD2;
					float4 LightCoord : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _CausticsTexture_ST;
			float4 _SteepVoronoiTexture_ST;
			float4 _NoiseLines_ST;
			float4 _Color5;
			float4 _ColorVariationTexture_ST;
			float4 _WaterfallSteepnessLineTexture_ST;
			float4 _Color4;
			float4 _FoamTexture_ST;
			float4 _Color3;
			float4 _WaterNormals_ST;
			float4 _CloudNoise_ST;
			float _FoamLinesWidthGradienceWaterfall;
			float _FoamLinesWidthGradience;
			float _FoamLinesLengthGradience;
			float _FoamLinesWaterfall;
			float _SteepWaterSmallDotsStep;
			float _FlatWaterSmallDotsStep;
			float _FoamLinesMaskWaterfall;
			float _FoamLinesMask;
			float _SteepVoronoiSpeed;
			float _SteepVoronoiDistortion;
			float _SteepWaterSmallDotsOpacity;
			float _FoamLinesOpacity;
			float _FlatWaterSmallDotsOpacity;
			float _SteepWaterStartDeg;
			float _WaterfallSteepnessLineSpeed;
			float _FoamLinesSpeedWaterfall;
			float _SlopeLinesOpacity;
			float _SteepVoronoiStep;
			float _SteepVoronoiOpacity;
			float _CausticsDepth;
			float _CausticsOpacity;
			float _NormalsStrength;
			float _DebugWaterColor;
			float _DebugNormals;
			float _DebugFlowLines;
			float _DebugEdgeFoam;
			float _DebugVoronoiFoam;
			float _DebugCloudNoise;
			float _SlopeLinesStep;
			float _FoamLinesSpeed;
			float _FoamLinesDistortion;
			float _FoamLinesLength;
			float _CausticsSpeed;
			float _GlobalSpeed;
			float _CloudNoiseSpeed;
			float _CausticsViewOffset;
			float _NormalsSpeed;
			float _NormalsDistortionIntensity;
			float _Refraction;
			float _ColorVariationSpeed;
			float _ColorVariationDepth;
			float _ColorVariationContrast;
			float _NoiseLinesSpeed;
			float _NoiseLinesDistortion;
			float _NoiseLinesOpacity;
			float _NoiseLinesReveal;
			float _NoiseLinesPow;
			float _ColorTransparencyDepthNear;
			float _ColorTransparencyDepthFar;
			float _FoamLinesNumber;
			float _FoamLinesDistortionWaterfall;
			float _Smoothness;
			float _FoamLinesPowWaterfall;
			float _FoamLinesPow;
			float _FoamNormalDistortion;
			float _FoamLinesLengthWaterfall;
			float _FoamSpeed;
			float _EdgeFoamIntensity;
			float _EdgeFoamContrast;
			float _EdgeFoamNoiseMultiplier;
			float _EdgeFoamDepth;
			float _EdgeFoamThickness;
			float _ColorMaxOpacity;
			float _FoamHardness;
			float _EdgeOpacityDistance;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _CausticsTexture;
			sampler2D _CloudNoise;
			sampler2D _WaterNormals;
			sampler2D _ColorVariationTexture;
			sampler2D _NoiseLines;
			sampler2D _FoamTexture;
			sampler2D _SteepVoronoiTexture;
			sampler2D _WaterfallSteepnessLineTexture;


			inline float4 ASE_ComputeGrabScreenPos( float4 pos )
			{
				#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
				#else
				float scale = 1.0;
				#endif
				float4 o = pos;
				o.y = pos.w * 0.5f;
				o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
				return o;
			}
			
			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float4 ase_positionCS = TransformObjectToHClip( ( input.positionOS ).xyz );
				float4 screenPos = ComputeScreenPos( ase_positionCS );
				output.ase_texcoord5 = screenPos;
				float3 ase_tangentWS = TransformObjectToWorldDir( input.ase_tangent.xyz );
				output.ase_texcoord6.xyz = ase_tangentWS;
				float3 ase_normalWS = TransformObjectToWorldNormal( input.normalOS );
				output.ase_texcoord7.xyz = ase_normalWS;
				float ase_tangentSign = input.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_bitangentWS = cross( ase_normalWS, ase_tangentWS ) * ase_tangentSign;
				output.ase_texcoord8.xyz = ase_bitangentWS;
				
				output.ase_texcoord4.xy = input.texcoord0.xy;
				output.ase_color = input.ase_color;
				output.ase_tangent = input.ase_tangent;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord4.zw = 0;
				output.ase_texcoord6.w = 0;
				output.ase_texcoord7.w = 0;
				output.ase_texcoord8.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;

				float3 positionWS = TransformObjectToWorld( input.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					output.positionWS = positionWS;
				#endif

				output.positionCS = MetaVertexPosition( input.positionOS, input.texcoord1.xy, input.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );

				#ifdef EDITOR_VISUALIZATION
					float2 VizUV = 0;
					float4 LightCoord = 0;
					UnityEditorVizData(input.positionOS.xyz, input.texcoord0.xy, input.texcoord1.xy, input.texcoord2.xy, VizUV, LightCoord);
					output.VizUV = float4(VizUV, 0, 0);
					output.LightCoord = LightCoord;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = output.positionCS;
					output.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.texcoord0 = input.texcoord0;
				output.texcoord1 = input.texcoord1;
				output.texcoord2 = input.texcoord2;
				output.ase_tangent = input.ase_tangent;
				output.ase_color = input.ase_color;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.texcoord0 = patch[0].texcoord0 * bary.x + patch[1].texcoord0 * bary.y + patch[2].texcoord0 * bary.z;
				output.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				output.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				output.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(PackedVaryings input  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = input.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = input.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_CausticsTexture = input.ase_texcoord4.xy * _CausticsTexture_ST.xy + _CausticsTexture_ST.zw;
				float Global_Speed903 = _GlobalSpeed;
				float mulTime714 = _TimeParameters.x * ( _CausticsSpeed * Global_Speed903 );
				float2 appendResult715 = (float2(0.0 , mulTime714));
				float2 uv_CloudNoise = input.ase_texcoord4.xy * _CloudNoise_ST.xy + _CloudNoise_ST.zw;
				float mulTime793 = _TimeParameters.x * ( _CloudNoiseSpeed * Global_Speed903 );
				float2 appendResult796 = (float2(0.0 , mulTime793));
				float4 Cloud_Noise473 = tex2D( _CloudNoise, ( uv_CloudNoise + appendResult796 ) );
				float3 Caustics811 = tex2D( _CausticsTexture, ( uv_CausticsTexture + appendResult715 + ( (Cloud_Noise473).rg * _CausticsViewOffset ) ) ).rgb;
				float4 screenPos = input.ase_texcoord5;
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float4 fetchOpaqueVal194 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ase_grabScreenPosNorm.xy.xy ), 1.0 );
				float2 uv_WaterNormals = input.ase_texcoord4.xy * _WaterNormals_ST.xy + _WaterNormals_ST.zw;
				float mulTime823 = _TimeParameters.x * ( Global_Speed903 * _NormalsSpeed );
				float2 appendResult824 = (float2(0.0 , mulTime823));
				float4 Normals205 = tex2D( _WaterNormals, ( uv_WaterNormals + appendResult824 + ( (Cloud_Noise473).rb * _NormalsDistortionIntensity ) ) );
				float3 unpack289 = UnpackNormalScale( Normals205, _Refraction );
				unpack289.z = lerp( 1, unpack289.z, saturate(_Refraction) );
				float4 temp_output_203_0 = ( ase_grabScreenPosNorm + float4( unpack289 , 0.0 ) );
				float4 fetchOpaqueVal290 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_203_0.xy.xy ), 1.0 );
				float ase_depthLinearEye = LinearEyeDepth( screenPos.z / screenPos.w, _ZBufferParams );
				float depthEye292 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( temp_output_203_0.xy ) * ( _ProjectionParams.z - _ProjectionParams.y );
				float4 lerpResult291 = lerp( fetchOpaqueVal194 , fetchOpaqueVal290 , step( ase_depthLinearEye , depthEye292 ));
				float3 Refracted_Background801 = (lerpResult291).rgb;
				float2 uv_ColorVariationTexture = input.ase_texcoord4.xy * _ColorVariationTexture_ST.xy + _ColorVariationTexture_ST.zw;
				float mulTime775 = _TimeParameters.x * ( _ColorVariationSpeed * Global_Speed903 );
				float2 appendResult777 = (float2(0.0 , mulTime775));
				float2 temp_output_778_0 = ( uv_ColorVariationTexture + appendResult777 );
				float4 tex2DNode780 = tex2D( _ColorVariationTexture, temp_output_778_0 );
				float3 ase_tangentWS = input.ase_texcoord6.xyz;
				float3 ase_normalWS = input.ase_texcoord7.xyz;
				float3 ase_bitangentWS = input.ase_texcoord8.xyz;
				float3 tanToWorld0 = float3( ase_tangentWS.x, ase_bitangentWS.x, ase_normalWS.x );
				float3 tanToWorld1 = float3( ase_tangentWS.y, ase_bitangentWS.y, ase_normalWS.y );
				float3 tanToWorld2 = float3( ase_tangentWS.z, ase_bitangentWS.z, ase_normalWS.z );
				float3 ase_viewVectorTS =  tanToWorld0 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).x + tanToWorld1 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).y  + tanToWorld2 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).z;
				float3 normalizeResult782 = normalize( ase_viewVectorTS );
				float2 paralaxOffset783 = ParallaxOffset( tex2DNode780.g , _ColorVariationDepth , normalizeResult782 );
				float3 lerpResult767 = lerp( _Color4.rgb , _Color3.rgb , pow( tex2D( _ColorVariationTexture, ( paralaxOffset783 + temp_output_778_0 ) ).g , _ColorVariationContrast ));
				float2 uv_NoiseLines = input.ase_texcoord4.xy * _NoiseLines_ST.xy + _NoiseLines_ST.zw;
				float mulTime751 = _TimeParameters.x * ( _NoiseLinesSpeed * Global_Speed903 );
				float2 appendResult755 = (float2(0.0 , mulTime751));
				float3 lerpResult770 = lerp( lerpResult767 , _Color5.rgb , pow( saturate( ( tex2D( _NoiseLines, ( uv_NoiseLines + appendResult755 + ( (Cloud_Noise473).rg * _NoiseLinesDistortion ) ) ).g * _NoiseLinesOpacity * pow( tex2DNode780.g , _NoiseLinesReveal ) ) ) , _NoiseLinesPow ));
				float3 Water_Color788 = lerpResult770;
				float4 ase_positionSSNorm = screenPos / screenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float depthLinearEye185 = LinearEyeDepth( SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_positionSSNorm.xy ), _ZBufferParams );
				float Scene_Depth206 = ( depthLinearEye185 - screenPos.w );
				float smoothstepResult542 = smoothstep( _ColorTransparencyDepthNear , _ColorTransparencyDepthFar , Scene_Depth206);
				float3 lerpResult197 = lerp( Refracted_Background801 , Water_Color788 , min( smoothstepResult542 , _ColorMaxOpacity ));
				float2 texCoord231 = input.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float EdgeMask236 = ( abs( ( texCoord231.x - 0.5 ) ) * 2.0 );
				float smoothstepResult261 = smoothstep( 0.0 , _EdgeFoamThickness , abs( ( EdgeMask236 - _EdgeFoamDepth ) ));
				float Edge_Foam325 = ( pow( saturate( ( ( (Cloud_Noise473).r - 1.0 ) + ( ( 1.0 - smoothstepResult261 ) * _EdgeFoamNoiseMultiplier ) ) ) , _EdgeFoamContrast ) * _EdgeFoamIntensity );
				float2 uv_FoamTexture = input.ase_texcoord4.xy * _FoamTexture_ST.xy + _FoamTexture_ST.zw;
				float mulTime301 = _TimeParameters.x * ( Global_Speed903 * -_FoamSpeed );
				float2 appendResult302 = (float2(0.0 , mulTime301));
				float3 unpack309 = UnpackNormalScale( Normals205, _FoamNormalDistortion );
				unpack309.z = lerp( 1, unpack309.z, saturate(_FoamNormalDistortion) );
				float2 appendResult321 = (float2(-unpack309.x , 0.0));
				float Painted_Foam323 = step( _FoamHardness , ( ( tex2D( _FoamTexture, ( uv_FoamTexture + ( float2( 0,0 ) + appendResult302 ) + appendResult321 ) ).r - 1.0 ) + input.ase_color.r ) );
				float3 objToWorldDir589 = normalize( mul( GetObjectToWorldMatrix(), float4( input.ase_tangent.xyz, 0.0 ) ).xyz );
				float SlopeInDeg29 = ( saturate( -objToWorldDir589.y ) * 90.0 );
				float smoothstepResult444 = smoothstep( 60.0 , 75.0 , SlopeInDeg29);
				float Waterfall_Mask445 = smoothstepResult444;
				float lerpResult459 = lerp( _FoamLinesPow , _FoamLinesPowWaterfall , Waterfall_Mask445);
				float temp_output_1_0_g18 = lerpResult459;
				float2 texCoord401 = input.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord331 = input.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult447 = lerp( _FoamLinesDistortion , _FoamLinesDistortionWaterfall , Waterfall_Mask445);
				float2 appendResult335 = (float2(( (Cloud_Noise473).r * lerpResult447 ) , 0.0));
				float2 temp_output_332_0 = ( texCoord331 + appendResult335 );
				float2 temp_cast_7 = (( ( 0.0 / _FoamLinesNumber ) * 0.5 )).xx;
				float temp_output_392_0 = sin( (floor( ( ( temp_output_332_0 - temp_cast_7 ) * _FoamLinesNumber ) )).x );
				float temp_output_393_0 = frac( ( temp_output_392_0 * 2357.156 ) );
				float temp_output_557_0 = step( 15.0 , SlopeInDeg29 );
				float lerpResult623 = lerp( _FoamLinesLength , _FoamLinesLengthWaterfall , temp_output_557_0);
				float lerpResult547 = lerp( _FoamLinesSpeed , ( _FoamLinesSpeed * _FoamLinesSpeedWaterfall ) , temp_output_557_0);
				float mulTime407 = _TimeParameters.x * ( ( (0.5 + (frac( ( temp_output_392_0 * 845.2346 ) ) - 0.0) * (1.5 - 0.5) / (1.0 - 0.0)) * ( _FoamLinesSpeed * lerpResult547 ) ) * Global_Speed903 );
				float temp_output_420_0 = ( ( ( temp_output_393_0 - 0.5 ) * 2.0 ) * 0.5 );
				float lerpResult462 = lerp( _FoamLinesMask , _FoamLinesMaskWaterfall , temp_output_557_0);
				float lerpResult455 = lerp( _FoamLinesWidthGradience , _FoamLinesWidthGradienceWaterfall , temp_output_557_0);
				float smoothstepResult443 = smoothstep( lerpResult455 , 1.0 , ( 1.0 - (abs( ( frac( ( temp_output_332_0 * _FoamLinesNumber ) ) - float2( 0.5,0.5 ) ) )).x ));
				float lerpResult7_g18 = lerp( ( 0.0 - temp_output_1_0_g18 ) , ( temp_output_1_0_g18 + 0.0 ) , ( pow( ( ( saturate( ( sin( ( ( ( texCoord401.y + 0.0 ) * (( lerpResult623 * 0.8 ) + (temp_output_393_0 - 0.0) * (( lerpResult623 * 1.2 ) - ( lerpResult623 * 0.8 )) / (1.0 - 0.0)) ) - mulTime407 ) ) - temp_output_420_0 ) ) * ( 1.0 / ( 1.0 - temp_output_420_0 ) ) ) * step( lerpResult462 , frac( ( temp_output_392_0 * 748.462 ) ) ) ) , _FoamLinesLengthGradience ) * smoothstepResult443 ));
				float clampResult8_g18 = clamp( lerpResult7_g18 , 0.0 , 1.0 );
				float smoothstepResult567 = smoothstep( 60.0 , 75.0 , SlopeInDeg29);
				float lerpResult569 = lerp( _FoamLinesOpacity , _FoamLinesWaterfall , temp_output_557_0);
				float Foam_Lines441 = ( saturate( ( saturate( clampResult8_g18 ) * ( abs( ( SlopeInDeg29 - 15.0 ) ) * 0.2 ) * ( 1.0 - smoothstepResult567 ) ) ) * lerpResult569 );
				float smoothstepResult615 = smoothstep( _SteepWaterStartDeg , ( _SteepWaterStartDeg + 5.0 ) , SlopeInDeg29);
				float lerpResult617 = lerp( _SteepWaterSmallDotsStep , _FlatWaterSmallDotsStep , smoothstepResult615);
				float2 uv_SteepVoronoiTexture = input.ase_texcoord4.xy * _SteepVoronoiTexture_ST.xy + _SteepVoronoiTexture_ST.zw;
				float mulTime69 = _TimeParameters.x * -( _SteepVoronoiSpeed * Global_Speed903 );
				float2 appendResult70 = (float2(0.0 , mulTime69));
				float Voronoi597 = tex2D( _SteepVoronoiTexture, ( uv_SteepVoronoiTexture + appendResult70 + ( _SteepVoronoiDistortion * (Cloud_Noise473).gb ) ) ).r;
				float lerpResult888 = lerp( _SteepWaterSmallDotsOpacity , _FlatWaterSmallDotsOpacity , smoothstepResult615);
				float Steep_Water_Small_Dots620 = ( step( lerpResult617 , Voronoi597 ) * lerpResult888 );
				float2 uv_WaterfallSteepnessLineTexture = input.ase_texcoord4.xy * _WaterfallSteepnessLineTexture_ST.xy + _WaterfallSteepnessLineTexture_ST.zw;
				float mulTime44 = _TimeParameters.x * ( -_WaterfallSteepnessLineSpeed * Global_Speed903 );
				float2 appendResult45 = (float2(0.0 , mulTime44));
				float WaterfallSteepLinesTex816 = tex2D( _WaterfallSteepnessLineTexture, ( uv_WaterfallSteepnessLineTexture + appendResult45 ) ).r;
				float Slope_Lines583 = ( step( _SlopeLinesStep , ( WaterfallSteepLinesTex816 * ( 1.0 - ( abs( ( SlopeInDeg29 - _SteepWaterStartDeg ) ) * 0.2 ) ) ) ) * _SlopeLinesOpacity );
				float smoothstepResult76 = smoothstep( ( _SteepWaterStartDeg - 5.0 ) , _SteepWaterStartDeg , SlopeInDeg29);
				float Steep_Voronoi850 = saturate( ( step( _SteepVoronoiStep , ( Voronoi597 * smoothstepResult76 ) ) * _SteepVoronoiOpacity ) );
				float3 lerpResult241 = lerp( lerpResult197 , float3( 1,1,1 ) , ( Edge_Foam325 + Painted_Foam323 + Foam_Lines441 + Steep_Water_Small_Dots620 + Slope_Lines583 + Steep_Voronoi850 ));
				float3 blendOpSrc730 = Caustics811;
				float3 blendOpDest730 = lerpResult241;
				float smoothstepResult741 = smoothstep( _CausticsDepth , 0.0 , Scene_Depth206);
				float Caustics_Alpha812 = saturate( ( smoothstepResult741 * _CausticsOpacity ) );
				float3 lerpBlendMode730 = lerp(blendOpDest730,( 1.0 - ( 1.0 - blendOpSrc730 ) * ( 1.0 - blendOpDest730 ) ),Caustics_Alpha812);
				float3 temp_cast_8 = (0.0).xxx;
				#ifdef _DEBUG_ON
				float3 staticSwitch855 = temp_cast_8;
				#else
				float3 staticSwitch855 = ( saturate( lerpBlendMode730 ));
				#endif
				
				float4 temp_cast_9 = (0.0).xxxx;
				#ifdef _DEBUG_ON
				float4 staticSwitch868 = ( float4( ( Water_Color788 * _DebugWaterColor ) , 0.0 ) + ( Normals205 * _DebugNormals ) + ( Foam_Lines441 * _DebugFlowLines ) + ( Edge_Foam325 * _DebugEdgeFoam ) + ( ( Steep_Voronoi850 + Steep_Water_Small_Dots620 ) * _DebugVoronoiFoam ) + ( Cloud_Noise473 * _DebugCloudNoise ) );
				#else
				float4 staticSwitch868 = temp_cast_9;
				#endif
				
				float smoothstepResult834 = smoothstep( 0.0 , _EdgeOpacityDistance , ( 1.0 - EdgeMask236 ));
				float Opacity839 = max( saturate( Edge_Foam325 ) , min( saturate( ( Scene_Depth206 / _EdgeOpacityDistance ) ) , smoothstepResult834 ) );
				#ifdef _DEBUG_ON
				float staticSwitch859 = 1.0;
				#else
				float staticSwitch859 = Opacity839;
				#endif
				

				float3 BaseColor = staticSwitch855;
				float3 Emission = staticSwitch868.rgb;
				float Alpha = staticSwitch859;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = BaseColor;
				metaInput.Emission = Emission;
				#ifdef EDITOR_VISUALIZATION
					metaInput.VizUV = input.VizUV.xy;
					metaInput.LightCoord = input.LightCoord;
				#endif

				return UnityMetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19801
			#define ASE_SRP_VERSION 140011
			#define REQUIRE_OPAQUE_TEXTURE 1
			#define REQUIRE_DEPTH_TEXTURE 1


			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _DEBUG_ON


			struct Attributes
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _CausticsTexture_ST;
			float4 _SteepVoronoiTexture_ST;
			float4 _NoiseLines_ST;
			float4 _Color5;
			float4 _ColorVariationTexture_ST;
			float4 _WaterfallSteepnessLineTexture_ST;
			float4 _Color4;
			float4 _FoamTexture_ST;
			float4 _Color3;
			float4 _WaterNormals_ST;
			float4 _CloudNoise_ST;
			float _FoamLinesWidthGradienceWaterfall;
			float _FoamLinesWidthGradience;
			float _FoamLinesLengthGradience;
			float _FoamLinesWaterfall;
			float _SteepWaterSmallDotsStep;
			float _FlatWaterSmallDotsStep;
			float _FoamLinesMaskWaterfall;
			float _FoamLinesMask;
			float _SteepVoronoiSpeed;
			float _SteepVoronoiDistortion;
			float _SteepWaterSmallDotsOpacity;
			float _FoamLinesOpacity;
			float _FlatWaterSmallDotsOpacity;
			float _SteepWaterStartDeg;
			float _WaterfallSteepnessLineSpeed;
			float _FoamLinesSpeedWaterfall;
			float _SlopeLinesOpacity;
			float _SteepVoronoiStep;
			float _SteepVoronoiOpacity;
			float _CausticsDepth;
			float _CausticsOpacity;
			float _NormalsStrength;
			float _DebugWaterColor;
			float _DebugNormals;
			float _DebugFlowLines;
			float _DebugEdgeFoam;
			float _DebugVoronoiFoam;
			float _DebugCloudNoise;
			float _SlopeLinesStep;
			float _FoamLinesSpeed;
			float _FoamLinesDistortion;
			float _FoamLinesLength;
			float _CausticsSpeed;
			float _GlobalSpeed;
			float _CloudNoiseSpeed;
			float _CausticsViewOffset;
			float _NormalsSpeed;
			float _NormalsDistortionIntensity;
			float _Refraction;
			float _ColorVariationSpeed;
			float _ColorVariationDepth;
			float _ColorVariationContrast;
			float _NoiseLinesSpeed;
			float _NoiseLinesDistortion;
			float _NoiseLinesOpacity;
			float _NoiseLinesReveal;
			float _NoiseLinesPow;
			float _ColorTransparencyDepthNear;
			float _ColorTransparencyDepthFar;
			float _FoamLinesNumber;
			float _FoamLinesDistortionWaterfall;
			float _Smoothness;
			float _FoamLinesPowWaterfall;
			float _FoamLinesPow;
			float _FoamNormalDistortion;
			float _FoamLinesLengthWaterfall;
			float _FoamSpeed;
			float _EdgeFoamIntensity;
			float _EdgeFoamContrast;
			float _EdgeFoamNoiseMultiplier;
			float _EdgeFoamDepth;
			float _EdgeFoamThickness;
			float _ColorMaxOpacity;
			float _FoamHardness;
			float _EdgeOpacityDistance;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _CausticsTexture;
			sampler2D _CloudNoise;
			sampler2D _WaterNormals;
			sampler2D _ColorVariationTexture;
			sampler2D _NoiseLines;
			sampler2D _FoamTexture;
			sampler2D _SteepVoronoiTexture;
			sampler2D _WaterfallSteepnessLineTexture;


			inline float4 ASE_ComputeGrabScreenPos( float4 pos )
			{
				#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
				#else
				float scale = 1.0;
				#endif
				float4 o = pos;
				o.y = pos.w * 0.5f;
				o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
				return o;
			}
			
			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID( input );
				UNITY_TRANSFER_INSTANCE_ID( input, output );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( output );

				float4 ase_positionCS = TransformObjectToHClip( ( input.positionOS ).xyz );
				float4 screenPos = ComputeScreenPos( ase_positionCS );
				output.ase_texcoord3 = screenPos;
				float3 ase_tangentWS = TransformObjectToWorldDir( input.ase_tangent.xyz );
				output.ase_texcoord4.xyz = ase_tangentWS;
				float3 ase_normalWS = TransformObjectToWorldNormal( input.normalOS );
				output.ase_texcoord5.xyz = ase_normalWS;
				float ase_tangentSign = input.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_bitangentWS = cross( ase_normalWS, ase_tangentWS ) * ase_tangentSign;
				output.ase_texcoord6.xyz = ase_bitangentWS;
				
				output.ase_texcoord2.xy = input.ase_texcoord.xy;
				output.ase_color = input.ase_color;
				output.ase_tangent = input.ase_tangent;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord2.zw = 0;
				output.ase_texcoord4.w = 0;
				output.ase_texcoord5.w = 0;
				output.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					output.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					output.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				output.positionCS = vertexInput.positionCS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_texcoord = input.ase_texcoord;
				output.ase_tangent = input.ase_tangent;
				output.ase_color = input.ase_color;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				output.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(PackedVaryings input  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( input );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = input.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = input.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_CausticsTexture = input.ase_texcoord2.xy * _CausticsTexture_ST.xy + _CausticsTexture_ST.zw;
				float Global_Speed903 = _GlobalSpeed;
				float mulTime714 = _TimeParameters.x * ( _CausticsSpeed * Global_Speed903 );
				float2 appendResult715 = (float2(0.0 , mulTime714));
				float2 uv_CloudNoise = input.ase_texcoord2.xy * _CloudNoise_ST.xy + _CloudNoise_ST.zw;
				float mulTime793 = _TimeParameters.x * ( _CloudNoiseSpeed * Global_Speed903 );
				float2 appendResult796 = (float2(0.0 , mulTime793));
				float4 Cloud_Noise473 = tex2D( _CloudNoise, ( uv_CloudNoise + appendResult796 ) );
				float3 Caustics811 = tex2D( _CausticsTexture, ( uv_CausticsTexture + appendResult715 + ( (Cloud_Noise473).rg * _CausticsViewOffset ) ) ).rgb;
				float4 screenPos = input.ase_texcoord3;
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( screenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float4 fetchOpaqueVal194 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ase_grabScreenPosNorm.xy.xy ), 1.0 );
				float2 uv_WaterNormals = input.ase_texcoord2.xy * _WaterNormals_ST.xy + _WaterNormals_ST.zw;
				float mulTime823 = _TimeParameters.x * ( Global_Speed903 * _NormalsSpeed );
				float2 appendResult824 = (float2(0.0 , mulTime823));
				float4 Normals205 = tex2D( _WaterNormals, ( uv_WaterNormals + appendResult824 + ( (Cloud_Noise473).rb * _NormalsDistortionIntensity ) ) );
				float3 unpack289 = UnpackNormalScale( Normals205, _Refraction );
				unpack289.z = lerp( 1, unpack289.z, saturate(_Refraction) );
				float4 temp_output_203_0 = ( ase_grabScreenPosNorm + float4( unpack289 , 0.0 ) );
				float4 fetchOpaqueVal290 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_203_0.xy.xy ), 1.0 );
				float ase_depthLinearEye = LinearEyeDepth( screenPos.z / screenPos.w, _ZBufferParams );
				float depthEye292 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( temp_output_203_0.xy ) * ( _ProjectionParams.z - _ProjectionParams.y );
				float4 lerpResult291 = lerp( fetchOpaqueVal194 , fetchOpaqueVal290 , step( ase_depthLinearEye , depthEye292 ));
				float3 Refracted_Background801 = (lerpResult291).rgb;
				float2 uv_ColorVariationTexture = input.ase_texcoord2.xy * _ColorVariationTexture_ST.xy + _ColorVariationTexture_ST.zw;
				float mulTime775 = _TimeParameters.x * ( _ColorVariationSpeed * Global_Speed903 );
				float2 appendResult777 = (float2(0.0 , mulTime775));
				float2 temp_output_778_0 = ( uv_ColorVariationTexture + appendResult777 );
				float4 tex2DNode780 = tex2D( _ColorVariationTexture, temp_output_778_0 );
				float3 ase_tangentWS = input.ase_texcoord4.xyz;
				float3 ase_normalWS = input.ase_texcoord5.xyz;
				float3 ase_bitangentWS = input.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( ase_tangentWS.x, ase_bitangentWS.x, ase_normalWS.x );
				float3 tanToWorld1 = float3( ase_tangentWS.y, ase_bitangentWS.y, ase_normalWS.y );
				float3 tanToWorld2 = float3( ase_tangentWS.z, ase_bitangentWS.z, ase_normalWS.z );
				float3 ase_viewVectorTS =  tanToWorld0 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).x + tanToWorld1 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).y  + tanToWorld2 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).z;
				float3 normalizeResult782 = normalize( ase_viewVectorTS );
				float2 paralaxOffset783 = ParallaxOffset( tex2DNode780.g , _ColorVariationDepth , normalizeResult782 );
				float3 lerpResult767 = lerp( _Color4.rgb , _Color3.rgb , pow( tex2D( _ColorVariationTexture, ( paralaxOffset783 + temp_output_778_0 ) ).g , _ColorVariationContrast ));
				float2 uv_NoiseLines = input.ase_texcoord2.xy * _NoiseLines_ST.xy + _NoiseLines_ST.zw;
				float mulTime751 = _TimeParameters.x * ( _NoiseLinesSpeed * Global_Speed903 );
				float2 appendResult755 = (float2(0.0 , mulTime751));
				float3 lerpResult770 = lerp( lerpResult767 , _Color5.rgb , pow( saturate( ( tex2D( _NoiseLines, ( uv_NoiseLines + appendResult755 + ( (Cloud_Noise473).rg * _NoiseLinesDistortion ) ) ).g * _NoiseLinesOpacity * pow( tex2DNode780.g , _NoiseLinesReveal ) ) ) , _NoiseLinesPow ));
				float3 Water_Color788 = lerpResult770;
				float4 ase_positionSSNorm = screenPos / screenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float depthLinearEye185 = LinearEyeDepth( SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_positionSSNorm.xy ), _ZBufferParams );
				float Scene_Depth206 = ( depthLinearEye185 - screenPos.w );
				float smoothstepResult542 = smoothstep( _ColorTransparencyDepthNear , _ColorTransparencyDepthFar , Scene_Depth206);
				float3 lerpResult197 = lerp( Refracted_Background801 , Water_Color788 , min( smoothstepResult542 , _ColorMaxOpacity ));
				float2 texCoord231 = input.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float EdgeMask236 = ( abs( ( texCoord231.x - 0.5 ) ) * 2.0 );
				float smoothstepResult261 = smoothstep( 0.0 , _EdgeFoamThickness , abs( ( EdgeMask236 - _EdgeFoamDepth ) ));
				float Edge_Foam325 = ( pow( saturate( ( ( (Cloud_Noise473).r - 1.0 ) + ( ( 1.0 - smoothstepResult261 ) * _EdgeFoamNoiseMultiplier ) ) ) , _EdgeFoamContrast ) * _EdgeFoamIntensity );
				float2 uv_FoamTexture = input.ase_texcoord2.xy * _FoamTexture_ST.xy + _FoamTexture_ST.zw;
				float mulTime301 = _TimeParameters.x * ( Global_Speed903 * -_FoamSpeed );
				float2 appendResult302 = (float2(0.0 , mulTime301));
				float3 unpack309 = UnpackNormalScale( Normals205, _FoamNormalDistortion );
				unpack309.z = lerp( 1, unpack309.z, saturate(_FoamNormalDistortion) );
				float2 appendResult321 = (float2(-unpack309.x , 0.0));
				float Painted_Foam323 = step( _FoamHardness , ( ( tex2D( _FoamTexture, ( uv_FoamTexture + ( float2( 0,0 ) + appendResult302 ) + appendResult321 ) ).r - 1.0 ) + input.ase_color.r ) );
				float3 objToWorldDir589 = normalize( mul( GetObjectToWorldMatrix(), float4( input.ase_tangent.xyz, 0.0 ) ).xyz );
				float SlopeInDeg29 = ( saturate( -objToWorldDir589.y ) * 90.0 );
				float smoothstepResult444 = smoothstep( 60.0 , 75.0 , SlopeInDeg29);
				float Waterfall_Mask445 = smoothstepResult444;
				float lerpResult459 = lerp( _FoamLinesPow , _FoamLinesPowWaterfall , Waterfall_Mask445);
				float temp_output_1_0_g18 = lerpResult459;
				float2 texCoord401 = input.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord331 = input.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult447 = lerp( _FoamLinesDistortion , _FoamLinesDistortionWaterfall , Waterfall_Mask445);
				float2 appendResult335 = (float2(( (Cloud_Noise473).r * lerpResult447 ) , 0.0));
				float2 temp_output_332_0 = ( texCoord331 + appendResult335 );
				float2 temp_cast_7 = (( ( 0.0 / _FoamLinesNumber ) * 0.5 )).xx;
				float temp_output_392_0 = sin( (floor( ( ( temp_output_332_0 - temp_cast_7 ) * _FoamLinesNumber ) )).x );
				float temp_output_393_0 = frac( ( temp_output_392_0 * 2357.156 ) );
				float temp_output_557_0 = step( 15.0 , SlopeInDeg29 );
				float lerpResult623 = lerp( _FoamLinesLength , _FoamLinesLengthWaterfall , temp_output_557_0);
				float lerpResult547 = lerp( _FoamLinesSpeed , ( _FoamLinesSpeed * _FoamLinesSpeedWaterfall ) , temp_output_557_0);
				float mulTime407 = _TimeParameters.x * ( ( (0.5 + (frac( ( temp_output_392_0 * 845.2346 ) ) - 0.0) * (1.5 - 0.5) / (1.0 - 0.0)) * ( _FoamLinesSpeed * lerpResult547 ) ) * Global_Speed903 );
				float temp_output_420_0 = ( ( ( temp_output_393_0 - 0.5 ) * 2.0 ) * 0.5 );
				float lerpResult462 = lerp( _FoamLinesMask , _FoamLinesMaskWaterfall , temp_output_557_0);
				float lerpResult455 = lerp( _FoamLinesWidthGradience , _FoamLinesWidthGradienceWaterfall , temp_output_557_0);
				float smoothstepResult443 = smoothstep( lerpResult455 , 1.0 , ( 1.0 - (abs( ( frac( ( temp_output_332_0 * _FoamLinesNumber ) ) - float2( 0.5,0.5 ) ) )).x ));
				float lerpResult7_g18 = lerp( ( 0.0 - temp_output_1_0_g18 ) , ( temp_output_1_0_g18 + 0.0 ) , ( pow( ( ( saturate( ( sin( ( ( ( texCoord401.y + 0.0 ) * (( lerpResult623 * 0.8 ) + (temp_output_393_0 - 0.0) * (( lerpResult623 * 1.2 ) - ( lerpResult623 * 0.8 )) / (1.0 - 0.0)) ) - mulTime407 ) ) - temp_output_420_0 ) ) * ( 1.0 / ( 1.0 - temp_output_420_0 ) ) ) * step( lerpResult462 , frac( ( temp_output_392_0 * 748.462 ) ) ) ) , _FoamLinesLengthGradience ) * smoothstepResult443 ));
				float clampResult8_g18 = clamp( lerpResult7_g18 , 0.0 , 1.0 );
				float smoothstepResult567 = smoothstep( 60.0 , 75.0 , SlopeInDeg29);
				float lerpResult569 = lerp( _FoamLinesOpacity , _FoamLinesWaterfall , temp_output_557_0);
				float Foam_Lines441 = ( saturate( ( saturate( clampResult8_g18 ) * ( abs( ( SlopeInDeg29 - 15.0 ) ) * 0.2 ) * ( 1.0 - smoothstepResult567 ) ) ) * lerpResult569 );
				float smoothstepResult615 = smoothstep( _SteepWaterStartDeg , ( _SteepWaterStartDeg + 5.0 ) , SlopeInDeg29);
				float lerpResult617 = lerp( _SteepWaterSmallDotsStep , _FlatWaterSmallDotsStep , smoothstepResult615);
				float2 uv_SteepVoronoiTexture = input.ase_texcoord2.xy * _SteepVoronoiTexture_ST.xy + _SteepVoronoiTexture_ST.zw;
				float mulTime69 = _TimeParameters.x * -( _SteepVoronoiSpeed * Global_Speed903 );
				float2 appendResult70 = (float2(0.0 , mulTime69));
				float Voronoi597 = tex2D( _SteepVoronoiTexture, ( uv_SteepVoronoiTexture + appendResult70 + ( _SteepVoronoiDistortion * (Cloud_Noise473).gb ) ) ).r;
				float lerpResult888 = lerp( _SteepWaterSmallDotsOpacity , _FlatWaterSmallDotsOpacity , smoothstepResult615);
				float Steep_Water_Small_Dots620 = ( step( lerpResult617 , Voronoi597 ) * lerpResult888 );
				float2 uv_WaterfallSteepnessLineTexture = input.ase_texcoord2.xy * _WaterfallSteepnessLineTexture_ST.xy + _WaterfallSteepnessLineTexture_ST.zw;
				float mulTime44 = _TimeParameters.x * ( -_WaterfallSteepnessLineSpeed * Global_Speed903 );
				float2 appendResult45 = (float2(0.0 , mulTime44));
				float WaterfallSteepLinesTex816 = tex2D( _WaterfallSteepnessLineTexture, ( uv_WaterfallSteepnessLineTexture + appendResult45 ) ).r;
				float Slope_Lines583 = ( step( _SlopeLinesStep , ( WaterfallSteepLinesTex816 * ( 1.0 - ( abs( ( SlopeInDeg29 - _SteepWaterStartDeg ) ) * 0.2 ) ) ) ) * _SlopeLinesOpacity );
				float smoothstepResult76 = smoothstep( ( _SteepWaterStartDeg - 5.0 ) , _SteepWaterStartDeg , SlopeInDeg29);
				float Steep_Voronoi850 = saturate( ( step( _SteepVoronoiStep , ( Voronoi597 * smoothstepResult76 ) ) * _SteepVoronoiOpacity ) );
				float3 lerpResult241 = lerp( lerpResult197 , float3( 1,1,1 ) , ( Edge_Foam325 + Painted_Foam323 + Foam_Lines441 + Steep_Water_Small_Dots620 + Slope_Lines583 + Steep_Voronoi850 ));
				float3 blendOpSrc730 = Caustics811;
				float3 blendOpDest730 = lerpResult241;
				float smoothstepResult741 = smoothstep( _CausticsDepth , 0.0 , Scene_Depth206);
				float Caustics_Alpha812 = saturate( ( smoothstepResult741 * _CausticsOpacity ) );
				float3 lerpBlendMode730 = lerp(blendOpDest730,( 1.0 - ( 1.0 - blendOpSrc730 ) * ( 1.0 - blendOpDest730 ) ),Caustics_Alpha812);
				float3 temp_cast_8 = (0.0).xxx;
				#ifdef _DEBUG_ON
				float3 staticSwitch855 = temp_cast_8;
				#else
				float3 staticSwitch855 = ( saturate( lerpBlendMode730 ));
				#endif
				
				float smoothstepResult834 = smoothstep( 0.0 , _EdgeOpacityDistance , ( 1.0 - EdgeMask236 ));
				float Opacity839 = max( saturate( Edge_Foam325 ) , min( saturate( ( Scene_Depth206 / _EdgeOpacityDistance ) ) , smoothstepResult834 ) );
				#ifdef _DEBUG_ON
				float staticSwitch859 = 1.0;
				#else
				float staticSwitch859 = Opacity839;
				#endif
				

				float3 BaseColor = staticSwitch855;
				float Alpha = staticSwitch859;
				float AlphaClipThreshold = 0.5;

				half4 color = half4(BaseColor, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormalsOnly" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			

			

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19801
			#define ASE_SRP_VERSION 140011
			#define REQUIRE_DEPTH_TEXTURE 1


			

			

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY
			//#define SHADERPASS SHADERPASS_DEPTHNORMALS

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			
			#if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#pragma shader_feature_local _DEBUG_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float3 positionWS : TEXCOORD1;
				float3 normalWS : TEXCOORD2;
				float4 tangentWS : TEXCOORD3;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD4;
				#endif
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _CausticsTexture_ST;
			float4 _SteepVoronoiTexture_ST;
			float4 _NoiseLines_ST;
			float4 _Color5;
			float4 _ColorVariationTexture_ST;
			float4 _WaterfallSteepnessLineTexture_ST;
			float4 _Color4;
			float4 _FoamTexture_ST;
			float4 _Color3;
			float4 _WaterNormals_ST;
			float4 _CloudNoise_ST;
			float _FoamLinesWidthGradienceWaterfall;
			float _FoamLinesWidthGradience;
			float _FoamLinesLengthGradience;
			float _FoamLinesWaterfall;
			float _SteepWaterSmallDotsStep;
			float _FlatWaterSmallDotsStep;
			float _FoamLinesMaskWaterfall;
			float _FoamLinesMask;
			float _SteepVoronoiSpeed;
			float _SteepVoronoiDistortion;
			float _SteepWaterSmallDotsOpacity;
			float _FoamLinesOpacity;
			float _FlatWaterSmallDotsOpacity;
			float _SteepWaterStartDeg;
			float _WaterfallSteepnessLineSpeed;
			float _FoamLinesSpeedWaterfall;
			float _SlopeLinesOpacity;
			float _SteepVoronoiStep;
			float _SteepVoronoiOpacity;
			float _CausticsDepth;
			float _CausticsOpacity;
			float _NormalsStrength;
			float _DebugWaterColor;
			float _DebugNormals;
			float _DebugFlowLines;
			float _DebugEdgeFoam;
			float _DebugVoronoiFoam;
			float _DebugCloudNoise;
			float _SlopeLinesStep;
			float _FoamLinesSpeed;
			float _FoamLinesDistortion;
			float _FoamLinesLength;
			float _CausticsSpeed;
			float _GlobalSpeed;
			float _CloudNoiseSpeed;
			float _CausticsViewOffset;
			float _NormalsSpeed;
			float _NormalsDistortionIntensity;
			float _Refraction;
			float _ColorVariationSpeed;
			float _ColorVariationDepth;
			float _ColorVariationContrast;
			float _NoiseLinesSpeed;
			float _NoiseLinesDistortion;
			float _NoiseLinesOpacity;
			float _NoiseLinesReveal;
			float _NoiseLinesPow;
			float _ColorTransparencyDepthNear;
			float _ColorTransparencyDepthFar;
			float _FoamLinesNumber;
			float _FoamLinesDistortionWaterfall;
			float _Smoothness;
			float _FoamLinesPowWaterfall;
			float _FoamLinesPow;
			float _FoamNormalDistortion;
			float _FoamLinesLengthWaterfall;
			float _FoamSpeed;
			float _EdgeFoamIntensity;
			float _EdgeFoamContrast;
			float _EdgeFoamNoiseMultiplier;
			float _EdgeFoamDepth;
			float _EdgeFoamThickness;
			float _ColorMaxOpacity;
			float _FoamHardness;
			float _EdgeOpacityDistance;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _WaterNormals;
			sampler2D _CloudNoise;


			
			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				output.ase_texcoord5.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord5.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );

				float3 normalWS = TransformObjectToWorldNormal( input.normalOS );
				float4 tangentWS = float4( TransformObjectToWorldDir( input.tangentOS.xyz ), input.tangentOS.w );

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					output.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				output.positionCS = vertexInput.positionCS;
				output.clipPosV = vertexInput.positionCS;
				output.positionWS = vertexInput.positionWS;
				output.normalWS = normalWS;
				output.tangentWS = tangentWS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				output.ase_texcoord = input.ase_texcoord;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			void frag(	PackedVaryings input
						, out half4 outNormalWS : SV_Target0
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 )
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( input );

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float3 WorldNormal = input.normalWS;
				float4 WorldTangent = input.tangentWS;
				float3 WorldPosition = input.positionWS;
				float4 ClipPos = input.clipPosV;
				float4 ScreenPos = ComputeScreenPos( input.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = input.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_WaterNormals = input.ase_texcoord5.xy * _WaterNormals_ST.xy + _WaterNormals_ST.zw;
				float Global_Speed903 = _GlobalSpeed;
				float mulTime823 = _TimeParameters.x * ( Global_Speed903 * _NormalsSpeed );
				float2 appendResult824 = (float2(0.0 , mulTime823));
				float2 uv_CloudNoise = input.ase_texcoord5.xy * _CloudNoise_ST.xy + _CloudNoise_ST.zw;
				float mulTime793 = _TimeParameters.x * ( _CloudNoiseSpeed * Global_Speed903 );
				float2 appendResult796 = (float2(0.0 , mulTime793));
				float4 Cloud_Noise473 = tex2D( _CloudNoise, ( uv_CloudNoise + appendResult796 ) );
				float4 Normals205 = tex2D( _WaterNormals, ( uv_WaterNormals + appendResult824 + ( (Cloud_Noise473).rb * _NormalsDistortionIntensity ) ) );
				float3 unpack177 = UnpackNormalScale( Normals205, _NormalsStrength );
				unpack177.z = lerp( 1, unpack177.z, saturate(_NormalsStrength) );
				float3 Final_Normals808 = unpack177;
				#ifdef _DEBUG_ON
				float3 staticSwitch856 = float3(0,0,1);
				#else
				float3 staticSwitch856 = Final_Normals808;
				#endif
				
				float2 texCoord231 = input.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float EdgeMask236 = ( abs( ( texCoord231.x - 0.5 ) ) * 2.0 );
				float smoothstepResult261 = smoothstep( 0.0 , _EdgeFoamThickness , abs( ( EdgeMask236 - _EdgeFoamDepth ) ));
				float Edge_Foam325 = ( pow( saturate( ( ( (Cloud_Noise473).r - 1.0 ) + ( ( 1.0 - smoothstepResult261 ) * _EdgeFoamNoiseMultiplier ) ) ) , _EdgeFoamContrast ) * _EdgeFoamIntensity );
				float4 ase_positionSSNorm = ScreenPos / ScreenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float depthLinearEye185 = LinearEyeDepth( SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_positionSSNorm.xy ), _ZBufferParams );
				float Scene_Depth206 = ( depthLinearEye185 - ScreenPos.w );
				float smoothstepResult834 = smoothstep( 0.0 , _EdgeOpacityDistance , ( 1.0 - EdgeMask236 ));
				float Opacity839 = max( saturate( Edge_Foam325 ) , min( saturate( ( Scene_Depth206 / _EdgeOpacityDistance ) ) , smoothstepResult834 ) );
				#ifdef _DEBUG_ON
				float staticSwitch859 = 1.0;
				#else
				float staticSwitch859 = Opacity839;
				#endif
				

				float3 Normal = staticSwitch856;
				float Alpha = staticSwitch859;
				float AlphaClipThreshold = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = input.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(WorldNormal);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					#if defined(_NORMALMAP)
						#if _NORMAL_DROPOFF_TS
							float crossSign = (WorldTangent.w > 0.0 ? 1.0 : -1.0) * GetOddNegativeScale();
							float3 bitangent = crossSign * cross(WorldNormal.xyz, WorldTangent.xyz);
							float3 normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent.xyz, bitangent, WorldNormal.xyz));
						#elif _NORMAL_DROPOFF_OS
							float3 normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							float3 normalWS = Normal;
						#endif
					#else
						float3 normalWS = WorldNormal;
					#endif
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4(EncodeMeshRenderingLayer(renderingLayers), 0, 0, 0);
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM

			

			#define _NORMAL_DROPOFF_TS 1
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19801
			#define ASE_SRP_VERSION 140011
			#define REQUIRE_OPAQUE_TEXTURE 1
			#define REQUIRE_DEPTH_TEXTURE 1


			

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION

			

			
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
           

			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
			#pragma multi_compile_fragment _ _RENDER_PASS_ENABLED

			

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SHADERPASS SHADERPASS_GBUFFER

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			
			#if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/RenderingLayers.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#pragma shader_feature_local _DEBUG_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct Attributes
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				#if defined(ASE_FOG) || defined(_ADDITIONAL_LIGHTS_VERTEX)
					half4 fogFactorAndVertexLight : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
				float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _CausticsTexture_ST;
			float4 _SteepVoronoiTexture_ST;
			float4 _NoiseLines_ST;
			float4 _Color5;
			float4 _ColorVariationTexture_ST;
			float4 _WaterfallSteepnessLineTexture_ST;
			float4 _Color4;
			float4 _FoamTexture_ST;
			float4 _Color3;
			float4 _WaterNormals_ST;
			float4 _CloudNoise_ST;
			float _FoamLinesWidthGradienceWaterfall;
			float _FoamLinesWidthGradience;
			float _FoamLinesLengthGradience;
			float _FoamLinesWaterfall;
			float _SteepWaterSmallDotsStep;
			float _FlatWaterSmallDotsStep;
			float _FoamLinesMaskWaterfall;
			float _FoamLinesMask;
			float _SteepVoronoiSpeed;
			float _SteepVoronoiDistortion;
			float _SteepWaterSmallDotsOpacity;
			float _FoamLinesOpacity;
			float _FlatWaterSmallDotsOpacity;
			float _SteepWaterStartDeg;
			float _WaterfallSteepnessLineSpeed;
			float _FoamLinesSpeedWaterfall;
			float _SlopeLinesOpacity;
			float _SteepVoronoiStep;
			float _SteepVoronoiOpacity;
			float _CausticsDepth;
			float _CausticsOpacity;
			float _NormalsStrength;
			float _DebugWaterColor;
			float _DebugNormals;
			float _DebugFlowLines;
			float _DebugEdgeFoam;
			float _DebugVoronoiFoam;
			float _DebugCloudNoise;
			float _SlopeLinesStep;
			float _FoamLinesSpeed;
			float _FoamLinesDistortion;
			float _FoamLinesLength;
			float _CausticsSpeed;
			float _GlobalSpeed;
			float _CloudNoiseSpeed;
			float _CausticsViewOffset;
			float _NormalsSpeed;
			float _NormalsDistortionIntensity;
			float _Refraction;
			float _ColorVariationSpeed;
			float _ColorVariationDepth;
			float _ColorVariationContrast;
			float _NoiseLinesSpeed;
			float _NoiseLinesDistortion;
			float _NoiseLinesOpacity;
			float _NoiseLinesReveal;
			float _NoiseLinesPow;
			float _ColorTransparencyDepthNear;
			float _ColorTransparencyDepthFar;
			float _FoamLinesNumber;
			float _FoamLinesDistortionWaterfall;
			float _Smoothness;
			float _FoamLinesPowWaterfall;
			float _FoamLinesPow;
			float _FoamNormalDistortion;
			float _FoamLinesLengthWaterfall;
			float _FoamSpeed;
			float _EdgeFoamIntensity;
			float _EdgeFoamContrast;
			float _EdgeFoamNoiseMultiplier;
			float _EdgeFoamDepth;
			float _EdgeFoamThickness;
			float _ColorMaxOpacity;
			float _FoamHardness;
			float _EdgeOpacityDistance;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _CausticsTexture;
			sampler2D _CloudNoise;
			sampler2D _WaterNormals;
			sampler2D _ColorVariationTexture;
			sampler2D _NoiseLines;
			sampler2D _FoamTexture;
			sampler2D _SteepVoronoiTexture;
			sampler2D _WaterfallSteepnessLineTexture;


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			inline float4 ASE_ComputeGrabScreenPos( float4 pos )
			{
				#if UNITY_UV_STARTS_AT_TOP
				float scale = -1.0;
				#else
				float scale = 1.0;
				#endif
				float4 o = pos;
				o.y = pos.w * 0.5f;
				o.y = ( pos.y - o.y ) * _ProjectionParams.x * scale + o.y;
				return o;
			}
			
			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				output.ase_texcoord8.xy = input.texcoord.xy;
				output.ase_color = input.ase_color;
				output.ase_tangent = input.tangentOS;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord8.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;
				input.tangentOS = input.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( input.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( input.normalOS, input.tangentOS );

				output.tSpace0 = float4( normalInput.normalWS, vertexInput.positionWS.x);
				output.tSpace1 = float4( normalInput.tangentWS, vertexInput.positionWS.y);
				output.tSpace2 = float4( normalInput.bitangentWS, vertexInput.positionWS.z);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV(input.texcoord1, unity_LightmapST, output.lightmapUVOrVertexSH.xy);
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					output.dynamicLightmapUV.xy = input.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH(normalInput.normalWS.xyz, output.lightmapUVOrVertexSH.xyz);
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					output.lightmapUVOrVertexSH.zw = input.texcoord.xy;
					output.lightmapUVOrVertexSH.xy = input.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				#if defined(ASE_FOG) || defined(_ADDITIONAL_LIGHTS_VERTEX)
					output.fogFactorAndVertexLight = 0;
					#if defined(ASE_FOG) && !defined(_FOG_FRAGMENT)
						// @diogo: no fog applied in GBuffer
					#endif
					#ifdef _ADDITIONAL_LIGHTS_VERTEX
						half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );
						output.fogFactorAndVertexLight.yzw = vertexLight;
					#endif
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					output.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				output.positionCS = vertexInput.positionCS;
				output.clipPosV = vertexInput.positionCS;
				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.tangentOS = input.tangentOS;
				output.texcoord = input.texcoord;
				output.texcoord1 = input.texcoord1;
				output.texcoord2 = input.texcoord2;
				output.ase_color = input.ase_color;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				output.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				output.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				output.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				output.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			FragmentOutput frag ( PackedVaryings input
								#ifdef ASE_DEPTH_WRITE_ON
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								 )
			{
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input);

				#if defined(LOD_FADE_CROSSFADE)
					LODFadeCrossFade( input.positionCS );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (input.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( input.tSpace0.xyz );
					float3 WorldTangent = input.tSpace1.xyz;
					float3 WorldBiTangent = input.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(input.tSpace0.w,input.tSpace1.w,input.tSpace2.w);
				float3 WorldViewDirection = GetWorldSpaceNormalizeViewDir( WorldPosition );
				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = input.clipPosV;
				float4 ScreenPos = ComputeScreenPos( input.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(input.positionCS);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = input.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#else
					ShadowCoords = float4(0, 0, 0, 0);
				#endif

				float2 uv_CausticsTexture = input.ase_texcoord8.xy * _CausticsTexture_ST.xy + _CausticsTexture_ST.zw;
				float Global_Speed903 = _GlobalSpeed;
				float mulTime714 = _TimeParameters.x * ( _CausticsSpeed * Global_Speed903 );
				float2 appendResult715 = (float2(0.0 , mulTime714));
				float2 uv_CloudNoise = input.ase_texcoord8.xy * _CloudNoise_ST.xy + _CloudNoise_ST.zw;
				float mulTime793 = _TimeParameters.x * ( _CloudNoiseSpeed * Global_Speed903 );
				float2 appendResult796 = (float2(0.0 , mulTime793));
				float4 Cloud_Noise473 = tex2D( _CloudNoise, ( uv_CloudNoise + appendResult796 ) );
				float3 Caustics811 = tex2D( _CausticsTexture, ( uv_CausticsTexture + appendResult715 + ( (Cloud_Noise473).rg * _CausticsViewOffset ) ) ).rgb;
				float4 ase_grabScreenPos = ASE_ComputeGrabScreenPos( ScreenPos );
				float4 ase_grabScreenPosNorm = ase_grabScreenPos / ase_grabScreenPos.w;
				float4 fetchOpaqueVal194 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( ase_grabScreenPosNorm.xy.xy ), 1.0 );
				float2 uv_WaterNormals = input.ase_texcoord8.xy * _WaterNormals_ST.xy + _WaterNormals_ST.zw;
				float mulTime823 = _TimeParameters.x * ( Global_Speed903 * _NormalsSpeed );
				float2 appendResult824 = (float2(0.0 , mulTime823));
				float4 Normals205 = tex2D( _WaterNormals, ( uv_WaterNormals + appendResult824 + ( (Cloud_Noise473).rb * _NormalsDistortionIntensity ) ) );
				float3 unpack289 = UnpackNormalScale( Normals205, _Refraction );
				unpack289.z = lerp( 1, unpack289.z, saturate(_Refraction) );
				float4 temp_output_203_0 = ( ase_grabScreenPosNorm + float4( unpack289 , 0.0 ) );
				float4 fetchOpaqueVal290 = float4( SHADERGRAPH_SAMPLE_SCENE_COLOR( temp_output_203_0.xy.xy ), 1.0 );
				float ase_depthLinearEye = LinearEyeDepth( ScreenPos.z / ScreenPos.w, _ZBufferParams );
				float depthEye292 = SHADERGRAPH_SAMPLE_SCENE_DEPTH( temp_output_203_0.xy ) * ( _ProjectionParams.z - _ProjectionParams.y );
				float4 lerpResult291 = lerp( fetchOpaqueVal194 , fetchOpaqueVal290 , step( ase_depthLinearEye , depthEye292 ));
				float3 Refracted_Background801 = (lerpResult291).rgb;
				float2 uv_ColorVariationTexture = input.ase_texcoord8.xy * _ColorVariationTexture_ST.xy + _ColorVariationTexture_ST.zw;
				float mulTime775 = _TimeParameters.x * ( _ColorVariationSpeed * Global_Speed903 );
				float2 appendResult777 = (float2(0.0 , mulTime775));
				float2 temp_output_778_0 = ( uv_ColorVariationTexture + appendResult777 );
				float4 tex2DNode780 = tex2D( _ColorVariationTexture, temp_output_778_0 );
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 ase_viewVectorTS =  tanToWorld0 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).x + tanToWorld1 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).y  + tanToWorld2 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).z;
				float3 normalizeResult782 = normalize( ase_viewVectorTS );
				float2 paralaxOffset783 = ParallaxOffset( tex2DNode780.g , _ColorVariationDepth , normalizeResult782 );
				float3 lerpResult767 = lerp( _Color4.rgb , _Color3.rgb , pow( tex2D( _ColorVariationTexture, ( paralaxOffset783 + temp_output_778_0 ) ).g , _ColorVariationContrast ));
				float2 uv_NoiseLines = input.ase_texcoord8.xy * _NoiseLines_ST.xy + _NoiseLines_ST.zw;
				float mulTime751 = _TimeParameters.x * ( _NoiseLinesSpeed * Global_Speed903 );
				float2 appendResult755 = (float2(0.0 , mulTime751));
				float3 lerpResult770 = lerp( lerpResult767 , _Color5.rgb , pow( saturate( ( tex2D( _NoiseLines, ( uv_NoiseLines + appendResult755 + ( (Cloud_Noise473).rg * _NoiseLinesDistortion ) ) ).g * _NoiseLinesOpacity * pow( tex2DNode780.g , _NoiseLinesReveal ) ) ) , _NoiseLinesPow ));
				float3 Water_Color788 = lerpResult770;
				float4 ase_positionSSNorm = ScreenPos / ScreenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float depthLinearEye185 = LinearEyeDepth( SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_positionSSNorm.xy ), _ZBufferParams );
				float Scene_Depth206 = ( depthLinearEye185 - ScreenPos.w );
				float smoothstepResult542 = smoothstep( _ColorTransparencyDepthNear , _ColorTransparencyDepthFar , Scene_Depth206);
				float3 lerpResult197 = lerp( Refracted_Background801 , Water_Color788 , min( smoothstepResult542 , _ColorMaxOpacity ));
				float2 texCoord231 = input.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float EdgeMask236 = ( abs( ( texCoord231.x - 0.5 ) ) * 2.0 );
				float smoothstepResult261 = smoothstep( 0.0 , _EdgeFoamThickness , abs( ( EdgeMask236 - _EdgeFoamDepth ) ));
				float Edge_Foam325 = ( pow( saturate( ( ( (Cloud_Noise473).r - 1.0 ) + ( ( 1.0 - smoothstepResult261 ) * _EdgeFoamNoiseMultiplier ) ) ) , _EdgeFoamContrast ) * _EdgeFoamIntensity );
				float2 uv_FoamTexture = input.ase_texcoord8.xy * _FoamTexture_ST.xy + _FoamTexture_ST.zw;
				float mulTime301 = _TimeParameters.x * ( Global_Speed903 * -_FoamSpeed );
				float2 appendResult302 = (float2(0.0 , mulTime301));
				float3 unpack309 = UnpackNormalScale( Normals205, _FoamNormalDistortion );
				unpack309.z = lerp( 1, unpack309.z, saturate(_FoamNormalDistortion) );
				float2 appendResult321 = (float2(-unpack309.x , 0.0));
				float Painted_Foam323 = step( _FoamHardness , ( ( tex2D( _FoamTexture, ( uv_FoamTexture + ( float2( 0,0 ) + appendResult302 ) + appendResult321 ) ).r - 1.0 ) + input.ase_color.r ) );
				float3 objToWorldDir589 = normalize( mul( GetObjectToWorldMatrix(), float4( input.ase_tangent.xyz, 0.0 ) ).xyz );
				float SlopeInDeg29 = ( saturate( -objToWorldDir589.y ) * 90.0 );
				float smoothstepResult444 = smoothstep( 60.0 , 75.0 , SlopeInDeg29);
				float Waterfall_Mask445 = smoothstepResult444;
				float lerpResult459 = lerp( _FoamLinesPow , _FoamLinesPowWaterfall , Waterfall_Mask445);
				float temp_output_1_0_g18 = lerpResult459;
				float2 texCoord401 = input.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float2 texCoord331 = input.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float lerpResult447 = lerp( _FoamLinesDistortion , _FoamLinesDistortionWaterfall , Waterfall_Mask445);
				float2 appendResult335 = (float2(( (Cloud_Noise473).r * lerpResult447 ) , 0.0));
				float2 temp_output_332_0 = ( texCoord331 + appendResult335 );
				float2 temp_cast_7 = (( ( 0.0 / _FoamLinesNumber ) * 0.5 )).xx;
				float temp_output_392_0 = sin( (floor( ( ( temp_output_332_0 - temp_cast_7 ) * _FoamLinesNumber ) )).x );
				float temp_output_393_0 = frac( ( temp_output_392_0 * 2357.156 ) );
				float temp_output_557_0 = step( 15.0 , SlopeInDeg29 );
				float lerpResult623 = lerp( _FoamLinesLength , _FoamLinesLengthWaterfall , temp_output_557_0);
				float lerpResult547 = lerp( _FoamLinesSpeed , ( _FoamLinesSpeed * _FoamLinesSpeedWaterfall ) , temp_output_557_0);
				float mulTime407 = _TimeParameters.x * ( ( (0.5 + (frac( ( temp_output_392_0 * 845.2346 ) ) - 0.0) * (1.5 - 0.5) / (1.0 - 0.0)) * ( _FoamLinesSpeed * lerpResult547 ) ) * Global_Speed903 );
				float temp_output_420_0 = ( ( ( temp_output_393_0 - 0.5 ) * 2.0 ) * 0.5 );
				float lerpResult462 = lerp( _FoamLinesMask , _FoamLinesMaskWaterfall , temp_output_557_0);
				float lerpResult455 = lerp( _FoamLinesWidthGradience , _FoamLinesWidthGradienceWaterfall , temp_output_557_0);
				float smoothstepResult443 = smoothstep( lerpResult455 , 1.0 , ( 1.0 - (abs( ( frac( ( temp_output_332_0 * _FoamLinesNumber ) ) - float2( 0.5,0.5 ) ) )).x ));
				float lerpResult7_g18 = lerp( ( 0.0 - temp_output_1_0_g18 ) , ( temp_output_1_0_g18 + 0.0 ) , ( pow( ( ( saturate( ( sin( ( ( ( texCoord401.y + 0.0 ) * (( lerpResult623 * 0.8 ) + (temp_output_393_0 - 0.0) * (( lerpResult623 * 1.2 ) - ( lerpResult623 * 0.8 )) / (1.0 - 0.0)) ) - mulTime407 ) ) - temp_output_420_0 ) ) * ( 1.0 / ( 1.0 - temp_output_420_0 ) ) ) * step( lerpResult462 , frac( ( temp_output_392_0 * 748.462 ) ) ) ) , _FoamLinesLengthGradience ) * smoothstepResult443 ));
				float clampResult8_g18 = clamp( lerpResult7_g18 , 0.0 , 1.0 );
				float smoothstepResult567 = smoothstep( 60.0 , 75.0 , SlopeInDeg29);
				float lerpResult569 = lerp( _FoamLinesOpacity , _FoamLinesWaterfall , temp_output_557_0);
				float Foam_Lines441 = ( saturate( ( saturate( clampResult8_g18 ) * ( abs( ( SlopeInDeg29 - 15.0 ) ) * 0.2 ) * ( 1.0 - smoothstepResult567 ) ) ) * lerpResult569 );
				float smoothstepResult615 = smoothstep( _SteepWaterStartDeg , ( _SteepWaterStartDeg + 5.0 ) , SlopeInDeg29);
				float lerpResult617 = lerp( _SteepWaterSmallDotsStep , _FlatWaterSmallDotsStep , smoothstepResult615);
				float2 uv_SteepVoronoiTexture = input.ase_texcoord8.xy * _SteepVoronoiTexture_ST.xy + _SteepVoronoiTexture_ST.zw;
				float mulTime69 = _TimeParameters.x * -( _SteepVoronoiSpeed * Global_Speed903 );
				float2 appendResult70 = (float2(0.0 , mulTime69));
				float Voronoi597 = tex2D( _SteepVoronoiTexture, ( uv_SteepVoronoiTexture + appendResult70 + ( _SteepVoronoiDistortion * (Cloud_Noise473).gb ) ) ).r;
				float lerpResult888 = lerp( _SteepWaterSmallDotsOpacity , _FlatWaterSmallDotsOpacity , smoothstepResult615);
				float Steep_Water_Small_Dots620 = ( step( lerpResult617 , Voronoi597 ) * lerpResult888 );
				float2 uv_WaterfallSteepnessLineTexture = input.ase_texcoord8.xy * _WaterfallSteepnessLineTexture_ST.xy + _WaterfallSteepnessLineTexture_ST.zw;
				float mulTime44 = _TimeParameters.x * ( -_WaterfallSteepnessLineSpeed * Global_Speed903 );
				float2 appendResult45 = (float2(0.0 , mulTime44));
				float WaterfallSteepLinesTex816 = tex2D( _WaterfallSteepnessLineTexture, ( uv_WaterfallSteepnessLineTexture + appendResult45 ) ).r;
				float Slope_Lines583 = ( step( _SlopeLinesStep , ( WaterfallSteepLinesTex816 * ( 1.0 - ( abs( ( SlopeInDeg29 - _SteepWaterStartDeg ) ) * 0.2 ) ) ) ) * _SlopeLinesOpacity );
				float smoothstepResult76 = smoothstep( ( _SteepWaterStartDeg - 5.0 ) , _SteepWaterStartDeg , SlopeInDeg29);
				float Steep_Voronoi850 = saturate( ( step( _SteepVoronoiStep , ( Voronoi597 * smoothstepResult76 ) ) * _SteepVoronoiOpacity ) );
				float3 lerpResult241 = lerp( lerpResult197 , float3( 1,1,1 ) , ( Edge_Foam325 + Painted_Foam323 + Foam_Lines441 + Steep_Water_Small_Dots620 + Slope_Lines583 + Steep_Voronoi850 ));
				float3 blendOpSrc730 = Caustics811;
				float3 blendOpDest730 = lerpResult241;
				float smoothstepResult741 = smoothstep( _CausticsDepth , 0.0 , Scene_Depth206);
				float Caustics_Alpha812 = saturate( ( smoothstepResult741 * _CausticsOpacity ) );
				float3 lerpBlendMode730 = lerp(blendOpDest730,( 1.0 - ( 1.0 - blendOpSrc730 ) * ( 1.0 - blendOpDest730 ) ),Caustics_Alpha812);
				float3 temp_cast_8 = (0.0).xxx;
				#ifdef _DEBUG_ON
				float3 staticSwitch855 = temp_cast_8;
				#else
				float3 staticSwitch855 = ( saturate( lerpBlendMode730 ));
				#endif
				
				float3 unpack177 = UnpackNormalScale( Normals205, _NormalsStrength );
				unpack177.z = lerp( 1, unpack177.z, saturate(_NormalsStrength) );
				float3 Final_Normals808 = unpack177;
				#ifdef _DEBUG_ON
				float3 staticSwitch856 = float3(0,0,1);
				#else
				float3 staticSwitch856 = Final_Normals808;
				#endif
				
				float4 temp_cast_10 = (0.0).xxxx;
				#ifdef _DEBUG_ON
				float4 staticSwitch868 = ( float4( ( Water_Color788 * _DebugWaterColor ) , 0.0 ) + ( Normals205 * _DebugNormals ) + ( Foam_Lines441 * _DebugFlowLines ) + ( Edge_Foam325 * _DebugEdgeFoam ) + ( ( Steep_Voronoi850 + Steep_Water_Small_Dots620 ) * _DebugVoronoiFoam ) + ( Cloud_Noise473 * _DebugCloudNoise ) );
				#else
				float4 staticSwitch868 = temp_cast_10;
				#endif
				
				#ifdef _DEBUG_ON
				float staticSwitch857 = 0.0;
				#else
				float staticSwitch857 = _Smoothness;
				#endif
				
				float smoothstepResult834 = smoothstep( 0.0 , _EdgeOpacityDistance , ( 1.0 - EdgeMask236 ));
				float Opacity839 = max( saturate( Edge_Foam325 ) , min( saturate( ( Scene_Depth206 / _EdgeOpacityDistance ) ) , smoothstepResult834 ) );
				#ifdef _DEBUG_ON
				float staticSwitch859 = 1.0;
				#else
				float staticSwitch859 = Opacity839;
				#endif
				

				float3 BaseColor = staticSwitch855;
				float3 Normal = staticSwitch856;
				float3 Emission = staticSwitch868.rgb;
				float3 Specular = 0.5;
				float Metallic = 0;
				float Smoothness = staticSwitch857;
				float Occlusion = 1;
				float Alpha = staticSwitch859;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = input.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.positionCS = input.positionCS;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
						inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
						inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
						inputData.normalWS = Normal;
					#endif
				#else
					inputData.normalWS = WorldNormal;
				#endif

				inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				inputData.viewDirectionWS = SafeNormalize( WorldViewDirection );

				#ifdef ASE_FOG
					// @diogo: no fog applied in GBuffer
				#endif
				#ifdef _ADDITIONAL_LIGHTS_VERTEX
					inputData.vertexLighting = input.fogFactorAndVertexLight.yzw;
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = input.lightmapUVOrVertexSH.xyz;
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#else
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.bakedGI = SAMPLE_GI( input.lightmapUVOrVertexSH.xy, input.dynamicLightmapUV.xy, SH, inputData.normalWS);
					#else
						inputData.bakedGI = SAMPLE_GI( input.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
					#endif
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(input.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = input.dynamicLightmapUV.xy;
						#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = input.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				#ifdef _DBUFFER
					ApplyDecal(input.positionCS,
						BaseColor,
						Specular,
						inputData.normalWS,
						Metallic,
						Occlusion,
						Smoothness);
				#endif

				BRDFData brdfData;
				InitializeBRDFData
				(BaseColor, Metallic, Specular, Smoothness, Alpha, brdfData);

				Light mainLight = GetMainLight(inputData.shadowCoord, inputData.positionWS, inputData.shadowMask);
				half4 color;
				MixRealtimeAndBakedGI(mainLight, inputData.normalWS, inputData.bakedGI, inputData.shadowMask);
				color.rgb = GlobalIllumination(brdfData, inputData.bakedGI, Occlusion, inputData.positionWS, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb, Occlusion);
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM

			

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19801
			#define ASE_SRP_VERSION 140011
			#define REQUIRE_DEPTH_TEXTURE 1


			

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

			#define SCENESELECTIONPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#pragma shader_feature_local _DEBUG_ON


			struct Attributes
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _CausticsTexture_ST;
			float4 _SteepVoronoiTexture_ST;
			float4 _NoiseLines_ST;
			float4 _Color5;
			float4 _ColorVariationTexture_ST;
			float4 _WaterfallSteepnessLineTexture_ST;
			float4 _Color4;
			float4 _FoamTexture_ST;
			float4 _Color3;
			float4 _WaterNormals_ST;
			float4 _CloudNoise_ST;
			float _FoamLinesWidthGradienceWaterfall;
			float _FoamLinesWidthGradience;
			float _FoamLinesLengthGradience;
			float _FoamLinesWaterfall;
			float _SteepWaterSmallDotsStep;
			float _FlatWaterSmallDotsStep;
			float _FoamLinesMaskWaterfall;
			float _FoamLinesMask;
			float _SteepVoronoiSpeed;
			float _SteepVoronoiDistortion;
			float _SteepWaterSmallDotsOpacity;
			float _FoamLinesOpacity;
			float _FlatWaterSmallDotsOpacity;
			float _SteepWaterStartDeg;
			float _WaterfallSteepnessLineSpeed;
			float _FoamLinesSpeedWaterfall;
			float _SlopeLinesOpacity;
			float _SteepVoronoiStep;
			float _SteepVoronoiOpacity;
			float _CausticsDepth;
			float _CausticsOpacity;
			float _NormalsStrength;
			float _DebugWaterColor;
			float _DebugNormals;
			float _DebugFlowLines;
			float _DebugEdgeFoam;
			float _DebugVoronoiFoam;
			float _DebugCloudNoise;
			float _SlopeLinesStep;
			float _FoamLinesSpeed;
			float _FoamLinesDistortion;
			float _FoamLinesLength;
			float _CausticsSpeed;
			float _GlobalSpeed;
			float _CloudNoiseSpeed;
			float _CausticsViewOffset;
			float _NormalsSpeed;
			float _NormalsDistortionIntensity;
			float _Refraction;
			float _ColorVariationSpeed;
			float _ColorVariationDepth;
			float _ColorVariationContrast;
			float _NoiseLinesSpeed;
			float _NoiseLinesDistortion;
			float _NoiseLinesOpacity;
			float _NoiseLinesReveal;
			float _NoiseLinesPow;
			float _ColorTransparencyDepthNear;
			float _ColorTransparencyDepthFar;
			float _FoamLinesNumber;
			float _FoamLinesDistortionWaterfall;
			float _Smoothness;
			float _FoamLinesPowWaterfall;
			float _FoamLinesPow;
			float _FoamNormalDistortion;
			float _FoamLinesLengthWaterfall;
			float _FoamSpeed;
			float _EdgeFoamIntensity;
			float _EdgeFoamContrast;
			float _EdgeFoamNoiseMultiplier;
			float _EdgeFoamDepth;
			float _EdgeFoamThickness;
			float _ColorMaxOpacity;
			float _FoamHardness;
			float _EdgeOpacityDistance;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _CloudNoise;


			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			PackedVaryings VertexFunction(Attributes input  )
			{
				PackedVaryings output;
				ZERO_INITIALIZE(PackedVaryings, output);

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float4 ase_positionCS = TransformObjectToHClip( ( input.positionOS ).xyz );
				float4 screenPos = ComputeScreenPos( ase_positionCS );
				output.ase_texcoord1 = screenPos;
				
				output.ase_texcoord.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;

				float3 positionWS = TransformObjectToWorld( input.positionOS.xyz );

				output.positionCS = TransformWorldToHClip(positionWS);

				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_texcoord = input.ase_texcoord;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(PackedVaryings input ) : SV_Target
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 uv_CloudNoise = input.ase_texcoord.xy * _CloudNoise_ST.xy + _CloudNoise_ST.zw;
				float Global_Speed903 = _GlobalSpeed;
				float mulTime793 = _TimeParameters.x * ( _CloudNoiseSpeed * Global_Speed903 );
				float2 appendResult796 = (float2(0.0 , mulTime793));
				float4 Cloud_Noise473 = tex2D( _CloudNoise, ( uv_CloudNoise + appendResult796 ) );
				float2 texCoord231 = input.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float EdgeMask236 = ( abs( ( texCoord231.x - 0.5 ) ) * 2.0 );
				float smoothstepResult261 = smoothstep( 0.0 , _EdgeFoamThickness , abs( ( EdgeMask236 - _EdgeFoamDepth ) ));
				float Edge_Foam325 = ( pow( saturate( ( ( (Cloud_Noise473).r - 1.0 ) + ( ( 1.0 - smoothstepResult261 ) * _EdgeFoamNoiseMultiplier ) ) ) , _EdgeFoamContrast ) * _EdgeFoamIntensity );
				float4 screenPos = input.ase_texcoord1;
				float4 ase_positionSSNorm = screenPos / screenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float depthLinearEye185 = LinearEyeDepth( SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_positionSSNorm.xy ), _ZBufferParams );
				float Scene_Depth206 = ( depthLinearEye185 - screenPos.w );
				float smoothstepResult834 = smoothstep( 0.0 , _EdgeOpacityDistance , ( 1.0 - EdgeMask236 ));
				float Opacity839 = max( saturate( Edge_Foam325 ) , min( saturate( ( Scene_Depth206 / _EdgeOpacityDistance ) ) , smoothstepResult834 ) );
				#ifdef _DEBUG_ON
				float staticSwitch859 = 1.0;
				#else
				float staticSwitch859 = Opacity839;
				#endif
				

				surfaceDescription.Alpha = staticSwitch859;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			AlphaToMask Off

			HLSLPROGRAM

			

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_VERSION 19801
			#define ASE_SRP_VERSION 140011
			#define REQUIRE_DEPTH_TEXTURE 1


			

			#pragma vertex vert
			#pragma fragment frag

			#if defined(_SPECULAR_SETUP) && defined(_ASE_LIGHTING_SIMPLE)
				#define _SPECULAR_COLOR 1
			#endif

		    #define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"

			
            #include "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRendering.hlsl"
           

			
            #if ASE_SRP_VERSION >=140009
			#include_with_pragmas "Packages/com.unity.render-pipelines.core/ShaderLibrary/FoveatedRenderingKeywords.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"

			
            #if ASE_SRP_VERSION >=140007
			#include_with_pragmas "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DOTS.hlsl"
			#endif
		

			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#pragma shader_feature_local _DEBUG_ON


			struct Attributes
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct PackedVaryings
			{
				float4 positionCS : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _CausticsTexture_ST;
			float4 _SteepVoronoiTexture_ST;
			float4 _NoiseLines_ST;
			float4 _Color5;
			float4 _ColorVariationTexture_ST;
			float4 _WaterfallSteepnessLineTexture_ST;
			float4 _Color4;
			float4 _FoamTexture_ST;
			float4 _Color3;
			float4 _WaterNormals_ST;
			float4 _CloudNoise_ST;
			float _FoamLinesWidthGradienceWaterfall;
			float _FoamLinesWidthGradience;
			float _FoamLinesLengthGradience;
			float _FoamLinesWaterfall;
			float _SteepWaterSmallDotsStep;
			float _FlatWaterSmallDotsStep;
			float _FoamLinesMaskWaterfall;
			float _FoamLinesMask;
			float _SteepVoronoiSpeed;
			float _SteepVoronoiDistortion;
			float _SteepWaterSmallDotsOpacity;
			float _FoamLinesOpacity;
			float _FlatWaterSmallDotsOpacity;
			float _SteepWaterStartDeg;
			float _WaterfallSteepnessLineSpeed;
			float _FoamLinesSpeedWaterfall;
			float _SlopeLinesOpacity;
			float _SteepVoronoiStep;
			float _SteepVoronoiOpacity;
			float _CausticsDepth;
			float _CausticsOpacity;
			float _NormalsStrength;
			float _DebugWaterColor;
			float _DebugNormals;
			float _DebugFlowLines;
			float _DebugEdgeFoam;
			float _DebugVoronoiFoam;
			float _DebugCloudNoise;
			float _SlopeLinesStep;
			float _FoamLinesSpeed;
			float _FoamLinesDistortion;
			float _FoamLinesLength;
			float _CausticsSpeed;
			float _GlobalSpeed;
			float _CloudNoiseSpeed;
			float _CausticsViewOffset;
			float _NormalsSpeed;
			float _NormalsDistortionIntensity;
			float _Refraction;
			float _ColorVariationSpeed;
			float _ColorVariationDepth;
			float _ColorVariationContrast;
			float _NoiseLinesSpeed;
			float _NoiseLinesDistortion;
			float _NoiseLinesOpacity;
			float _NoiseLinesReveal;
			float _NoiseLinesPow;
			float _ColorTransparencyDepthNear;
			float _ColorTransparencyDepthFar;
			float _FoamLinesNumber;
			float _FoamLinesDistortionWaterfall;
			float _Smoothness;
			float _FoamLinesPowWaterfall;
			float _FoamLinesPow;
			float _FoamNormalDistortion;
			float _FoamLinesLengthWaterfall;
			float _FoamSpeed;
			float _EdgeFoamIntensity;
			float _EdgeFoamContrast;
			float _EdgeFoamNoiseMultiplier;
			float _EdgeFoamDepth;
			float _EdgeFoamThickness;
			float _ColorMaxOpacity;
			float _FoamHardness;
			float _EdgeOpacityDistance;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _CloudNoise;


			
			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			PackedVaryings VertexFunction(Attributes input  )
			{
				PackedVaryings output;
				ZERO_INITIALIZE(PackedVaryings, output);

				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float4 ase_positionCS = TransformObjectToHClip( ( input.positionOS ).xyz );
				float4 screenPos = ComputeScreenPos( ase_positionCS );
				output.ase_texcoord1 = screenPos;
				
				output.ase_texcoord.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = input.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					input.positionOS.xyz = vertexValue;
				#else
					input.positionOS.xyz += vertexValue;
				#endif

				input.normalOS = input.normalOS;

				float3 positionWS = TransformObjectToWorld( input.positionOS.xyz );
				output.positionCS = TransformWorldToHClip(positionWS);

				return output;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 positionOS : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( Attributes input )
			{
				VertexControl output;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				output.positionOS = input.positionOS;
				output.normalOS = input.normalOS;
				output.ase_texcoord = input.ase_texcoord;
				return output;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> input)
			{
				TessellationFactors output;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(input[0].positionOS, input[1].positionOS, input[2].positionOS, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				output.edge[0] = tf.x; output.edge[1] = tf.y; output.edge[2] = tf.z; output.inside = tf.w;
				return output;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			PackedVaryings DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				Attributes output = (Attributes) 0;
				output.positionOS = patch[0].positionOS * bary.x + patch[1].positionOS * bary.y + patch[2].positionOS * bary.z;
				output.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				output.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = output.positionOS.xyz - patch[i].normalOS * (dot(output.positionOS.xyz, patch[i].normalOS) - dot(patch[i].positionOS.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				output.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * output.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], output);
				return VertexFunction(output);
			}
			#else
			PackedVaryings vert ( Attributes input )
			{
				return VertexFunction( input );
			}
			#endif

			half4 frag(PackedVaryings input ) : SV_Target
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 uv_CloudNoise = input.ase_texcoord.xy * _CloudNoise_ST.xy + _CloudNoise_ST.zw;
				float Global_Speed903 = _GlobalSpeed;
				float mulTime793 = _TimeParameters.x * ( _CloudNoiseSpeed * Global_Speed903 );
				float2 appendResult796 = (float2(0.0 , mulTime793));
				float4 Cloud_Noise473 = tex2D( _CloudNoise, ( uv_CloudNoise + appendResult796 ) );
				float2 texCoord231 = input.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float EdgeMask236 = ( abs( ( texCoord231.x - 0.5 ) ) * 2.0 );
				float smoothstepResult261 = smoothstep( 0.0 , _EdgeFoamThickness , abs( ( EdgeMask236 - _EdgeFoamDepth ) ));
				float Edge_Foam325 = ( pow( saturate( ( ( (Cloud_Noise473).r - 1.0 ) + ( ( 1.0 - smoothstepResult261 ) * _EdgeFoamNoiseMultiplier ) ) ) , _EdgeFoamContrast ) * _EdgeFoamIntensity );
				float4 screenPos = input.ase_texcoord1;
				float4 ase_positionSSNorm = screenPos / screenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float depthLinearEye185 = LinearEyeDepth( SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_positionSSNorm.xy ), _ZBufferParams );
				float Scene_Depth206 = ( depthLinearEye185 - screenPos.w );
				float smoothstepResult834 = smoothstep( 0.0 , _EdgeOpacityDistance , ( 1.0 - EdgeMask236 ));
				float Opacity839 = max( saturate( Edge_Foam325 ) , min( saturate( ( Scene_Depth206 / _EdgeOpacityDistance ) ) , smoothstepResult834 ) );
				#ifdef _DEBUG_ON
				float staticSwitch859 = 1.0;
				#else
				float staticSwitch859 = Opacity839;
				#endif
				

				surfaceDescription.Alpha = staticSwitch859;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
						clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}
		
	}
	
	CustomEditor "UnityEditor.ShaderGraphLitGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19801
Node;AmplifyShaderEditor.CommentaryNode;844;-2016,-1936;Inherit;False;996;219;Edge Mask;5;231;232;234;233;236;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;899;-6480,-2896;Inherit;False;Property;_GlobalSpeed;Global Speed;74;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;805;-3712,-2400;Inherit;False;1364;435;Cloud Noise;9;791;790;793;792;796;797;798;473;907;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;903;-6304,-2896;Inherit;False;Global Speed;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;231;-1952,-1888;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;791;-3680,-2160;Inherit;False;Property;_CloudNoiseSpeed;Cloud Noise Speed;2;0;Create;True;0;0;0;False;0;False;-0.1;-0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;909;-3760,-2048;Inherit;False;903;Global Speed;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;232;-1728,-1856;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;907;-3552,-2080;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;234;-1552,-1856;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;793;-3408,-2080;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;790;-3664,-2352;Inherit;True;Property;_CloudNoise;Cloud Noise;4;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;233;-1408,-1856;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;842;-1120,-2400;Inherit;False;2148;387;Edge Foam;19;252;221;253;254;214;261;262;246;244;248;745;269;744;270;325;242;245;247;225;;1,1,1,1;0;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;792;-3424,-2224;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;796;-3216,-2112;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;236;-1248,-1856;Inherit;False;EdgeMask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;797;-3040,-2224;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;252;-992,-2240;Inherit;False;236;EdgeMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;221;-1072,-2160;Inherit;False;Property;_EdgeFoamDepth;Edge Foam Depth;27;0;Create;True;0;0;0;False;0;False;0.9;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;798;-2912,-2352;Inherit;True;Property;_TextureSample10;Texture Sample 1;7;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;3;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleSubtractOpNode;253;-752,-2240;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;473;-2592,-2352;Inherit;False;Cloud Noise;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.AbsOpNode;254;-592,-2240;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;214;-752,-2128;Inherit;False;Property;_EdgeFoamThickness;Edge Foam Thickness;24;0;Create;True;0;0;0;False;0;False;0.1;0;0;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;261;-448,-2240;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;245;-384,-2352;Inherit;False;473;Cloud Noise;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;262;-256,-2240;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;247;-208,-2352;Inherit;False;True;False;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;225;-272,-2160;Inherit;False;Property;_EdgeFoamNoiseMultiplier;Edge Foam Noise Multiplier;28;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;845;1070,-2386;Inherit;False;692;339;Scene Depth;4;186;187;206;185;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;246;0,-2240;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;242;0,-2352;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;186;1120,-2256;Float;False;1;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenDepthNode;185;1120,-2336;Inherit;False;0;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;244;144,-2352;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;187;1376,-2272;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;248;288,-2352;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;744;160,-2256;Inherit;False;Property;_EdgeFoamContrast;Edge Foam Contrast;32;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;841;-2288,-2400;Inherit;False;1097.889;422.2974;Opacity;12;839;933;932;929;926;834;928;833;832;925;836;326;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;206;1520,-2272;Inherit;False;Scene Depth;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;745;448,-2352;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;270;384,-2256;Inherit;False;Property;_EdgeFoamIntensity;Edge Foam Intensity;31;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;925;-2224,-2256;Inherit;False;206;Scene Depth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;928;-2224,-2064;Inherit;False;Property;_EdgeOpacityDistance;Edge Opacity Distance;75;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;269;624,-2352;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;832;-2224,-2144;Inherit;False;236;EdgeMask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;926;-2032,-2256;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;325;784,-2352;Inherit;False;Edge Foam;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;833;-2048,-2144;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;929;-1920,-2256;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;326;-2224,-2352;Inherit;False;325;Edge Foam;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;834;-1904,-2144;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;836;-2048,-2352;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMinOpNode;932;-1632,-2256;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;933;-1520,-2352;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;839;-1408,-2352;Inherit;False;Opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;843;-3712,-1936;Inherit;False;1652;243;Slope Calculations;9;595;596;30;444;29;445;586;589;587;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;852;-6848,-1664;Inherit;False;5812;1363;Flow Lines;94;446;337;448;333;334;447;336;339;331;335;349;332;350;348;352;351;353;405;392;429;430;394;623;548;409;393;414;415;401;408;402;410;407;404;425;338;426;553;340;420;400;341;427;423;416;342;428;422;417;343;411;421;412;432;439;443;458;375;460;438;459;431;560;440;567;559;566;558;570;571;563;569;568;441;397;624;413;356;547;452;549;545;557;554;555;556;436;456;455;463;464;462;906;902;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;837;-5664,-2384;Inherit;False;1876;595;Normals;17;160;826;148;823;827;175;820;824;828;822;821;205;178;177;808;901;905;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;853;1120,-1984;Inherit;False;2308;579;Steep Voronoi;25;74;68;806;69;99;65;807;98;71;70;72;847;59;78;848;597;76;82;84;83;849;88;86;850;912;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;804;-3186,-3570;Inherit;False;3012;1115;Water Color;42;772;771;775;773;777;778;779;780;781;782;783;784;785;786;787;748;749;757;746;747;751;752;753;755;756;763;766;767;769;770;788;758;760;762;764;768;765;761;918;919;920;759;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;819;-96,-2832;Inherit;False;3323.061;379.3271;Slope Lines;23;816;40;63;47;45;62;44;50;46;583;581;582;579;580;576;578;818;575;574;573;600;572;915;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;846;-960,-1936;Inherit;False;2020;483;Painted Foam;20;298;296;297;303;302;301;300;299;321;322;309;310;306;311;313;318;314;317;323;911;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;803;-96,-3568;Inherit;False;2276;699;Refraction;13;286;201;289;193;203;292;293;295;290;194;291;800;801;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;838;-5290.846,-3584;Inherit;False;1982.846;353.3218;Small Dots;14;884;883;617;615;620;619;613;621;598;599;886;887;889;888;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;815;-5299.386,-3184;Inherit;False;2007.386;712.2761;Caustics;21;736;812;740;738;731;741;732;811;692;937;668;689;936;810;904;898;713;715;712;656;714;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;860;608,-352;Inherit;False;Constant;_Float1;Float 0;69;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;840;576,-416;Inherit;False;839;Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.TangentVertexDataNode;586;-3664,-1888;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TransformDirectionNode;589;-3472,-1888;Inherit;False;Object;World;True;Fast;False;1;0;FLOAT3;1,0,0;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.BreakToComponentsNode;587;-3248,-1888;Inherit;False;FLOAT3;1;0;FLOAT3;0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.NegateNode;595;-3136,-1856;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;596;-2992,-1856;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;30;-2848,-1856;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;90;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;29;-2688,-1856;Inherit;False;SlopeInDeg;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;444;-2480,-1856;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;60;False;2;FLOAT;75;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;445;-2304,-1856;Inherit;False;Waterfall Mask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;446;-6800,-496;Inherit;False;Property;_FoamLinesDistortionWaterfall;Foam Lines Distortion Waterfall;39;0;Create;True;0;0;0;False;0;False;0.05;0;0;0.2;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;337;-6800,-576;Inherit;False;Property;_FoamLinesDistortion;Foam Lines Distortion;40;0;Create;True;0;0;0;False;0;False;0.05;0;0;0.2;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;333;-6592,-672;Inherit;False;473;Cloud Noise;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;448;-6720,-416;Inherit;False;445;Waterfall Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;334;-6400,-672;Inherit;False;True;False;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;447;-6496,-560;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;336;-6144,-656;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;339;-6336,-448;Inherit;False;Property;_FoamLinesNumber;Foam Lines Number;45;0;Create;True;0;0;0;False;0;False;20;20;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;331;-6384,-848;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;335;-5968,-704;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;349;-5968,-528;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;332;-5936,-864;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;350;-5840,-528;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;352;-5568,-432;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;348;-5648,-576;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;351;-5440,-576;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FloorOpNode;353;-5280,-576;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;405;-5056,-1136;Inherit;False;True;False;True;True;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;392;-4784,-1152;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;356;-4976,-768;Inherit;False;Property;_FoamLinesSpeed;Foam Lines Speed;43;0;Create;True;0;0;0;False;0;False;0.15;-0.15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;452;-5040,-672;Inherit;False;Property;_FoamLinesSpeedWaterfall;Foam Lines Speed Waterfall;44;0;Create;True;0;0;0;False;0;False;0.15;-0.15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;545;-5056,-544;Inherit;False;29;SlopeInDeg;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;549;-4736,-720;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;429;-4608,-1040;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;845.2346;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;557;-4848,-560;Inherit;False;2;0;FLOAT;15;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;624;-4880,-1376;Inherit;False;Property;_FoamLinesLengthWaterfall;Foam Lines Length Waterfall;46;0;Create;True;0;0;0;False;0;False;20;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;413;-4816,-1456;Inherit;False;Property;_FoamLinesLength;Foam Lines Length;47;0;Create;True;0;0;0;False;0;False;20;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;430;-4432,-1040;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;547;-4544,-768;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;623;-4576,-1456;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;394;-4608,-1152;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2357.156;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;548;-4336,-816;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;409;-4224,-1104;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;0.5;False;4;FLOAT;1.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;401;-4336,-1616;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;415;-4304,-1440;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.8;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;414;-4304,-1344;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;393;-4432,-1152;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;160;-5600,-2064;Inherit;False;Property;_NormalsSpeed;Normals Speed;18;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;408;-3984,-1104;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;905;-5648,-2144;Inherit;False;903;Global Speed;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;906;-4016,-992;Inherit;False;903;Global Speed;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;402;-4064,-1568;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;410;-4096,-1472;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;3;FLOAT;17;False;4;FLOAT;23;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;826;-5616,-1984;Inherit;False;473;Cloud Noise;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;901;-5440,-2160;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;902;-3760,-1088;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;407;-3712,-1408;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;404;-3840,-1568;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;20;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;425;-3904,-1248;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;823;-5408,-2064;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;827;-5440,-1984;Inherit;False;True;False;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;148;-5552,-2336;Inherit;True;Property;_WaterNormals;Water Normals;16;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;175;-5504,-1904;Inherit;False;Property;_NormalsDistortionIntensity;Normals Distortion Intensity;19;0;Create;True;0;0;0;False;0;False;0.05;0;0;0.2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;338;-5712,-864;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;553;-3536,-1568;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;426;-3744,-1248;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;820;-5296,-2208;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;824;-5232,-2096;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;828;-5232,-1968;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FractNode;340;-5536,-864;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SinOpNode;400;-3328,-1568;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;420;-3472,-1328;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;822;-5040,-2176;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;74;1168,-1664;Inherit;False;Property;_SteepVoronoiSpeed;Steep Voronoi Speed;7;0;Create;True;0;0;0;False;0;False;0.2;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;914;1056,-1584;Inherit;False;903;Global Speed;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;772;-3168,-2672;Inherit;False;Property;_ColorVariationSpeed;Color Variation Speed;8;0;Create;True;0;0;0;False;0;False;-0.1;-0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;919;-3168,-2576;Inherit;False;903;Global Speed;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;46;1376,-2576;Inherit;False;Property;_WaterfallSteepnessLineSpeed;Waterfall Steepness Line Speed;0;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;423;-3264,-1280;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;416;-3184,-1568;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;463;-4048,-704;Inherit;False;Property;_FoamLinesMask;Foam Lines Mask;51;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;464;-4048,-624;Inherit;False;Property;_FoamLinesMaskWaterfall;Foam Lines Mask Waterfall;52;0;Create;True;0;0;0;False;0;False;0.7623556;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;341;-5376,-864;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;427;-4592,-928;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;748.462;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;821;-4880,-2336;Inherit;True;Property;_TextureSample1;Texture Sample 1;79;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;299;-880,-1760;Inherit;False;Property;_FoamSpeed;Foam Speed;36;0;Create;True;0;0;0;False;0;False;0.2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;912;1264,-1600;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;918;-2944,-2608;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;50;1680,-2576;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;917;1616,-2496;Inherit;False;903;Global Speed;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;68;1376,-1664;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;806;1312,-1504;Inherit;False;473;Cloud Noise;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode;771;-3136,-2976;Inherit;True;Property;_ColorVariationTexture;Color Variation Texture;9;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.FractNode;428;-4432,-928;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;422;-3088,-1312;Inherit;False;2;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;417;-3008,-1568;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;342;-5200,-864;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;462;-3728,-640;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;205;-4544,-2336;Inherit;False;Normals;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.NegateNode;300;-704,-1760;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;911;-896,-1856;Inherit;False;903;Global Speed;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;775;-2816,-2608;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;746;-3200,-3328;Inherit;False;Property;_NoiseLinesSpeed;Noise Lines Speed;33;0;Create;True;0;0;0;False;0;False;-0.2;-0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;921;-3216,-3248;Inherit;False;903;Global Speed;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;915;1824,-2576;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;69;1520,-1664;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;99;1424,-1584;Inherit;False;Property;_SteepVoronoiDistortion;Steep Voronoi Distortion;11;0;Create;True;0;0;0;False;0;False;0.05;0.05;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;65;1216,-1920;Inherit;True;Property;_SteepVoronoiTexture;Steep Voronoi Texture;3;0;Create;True;0;0;0;False;0;False;5b7de9f470c626541ae97a4812d5762e;5b7de9f470c626541ae97a4812d5762e;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ComponentMaskNode;807;1488,-1504;Inherit;False;False;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;773;-2880,-2768;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;777;-2624,-2640;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;747;-3088,-3168;Inherit;False;473;Cloud Noise;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;343;-5056,-864;Inherit;False;True;False;True;True;1;0;FLOAT2;0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;411;-3392,-976;Inherit;False;2;0;FLOAT;0.5;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;421;-2784,-1408;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;436;-4000,-880;Inherit;False;Property;_FoamLinesWidthGradience;Foam Lines Width Gradience;48;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;456;-4000,-800;Inherit;False;Property;_FoamLinesWidthGradienceWaterfall;Foam Lines Width Gradience Waterfall;49;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;44;1968,-2576;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;62;1648,-2768;Inherit;True;Property;_WaterfallSteepnessLineTexture;Waterfall Steepness Line Texture;1;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;310;-912,-1600;Inherit;False;Property;_FoamNormalDistortion;Foam Normal Distortion;37;0;Create;True;0;0;0;False;0;False;0.02282609;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;306;-816,-1680;Inherit;False;205;Normals;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;910;-681.2908,-1865.85;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;920;-3008,-3280;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;98;1696,-1568;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;71;1568,-1792;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;70;1696,-1664;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;778;-2432,-2768;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ViewVectorNode;779;-2336,-2640;Inherit;False;Tangent;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.ComponentMaskNode;752;-2912,-3168;Inherit;False;True;True;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;753;-2976,-3088;Inherit;False;Property;_NoiseLinesDistortion;Noise Lines Distortion;30;0;Create;True;0;0;0;False;0;False;0.042;0;0;0.3;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;412;-2752,-1248;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;432;-3584,-1152;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;439;-2880,-1152;Inherit;False;Property;_FoamLinesLengthGradience;Foam Lines Length Gradience;50;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;455;-3680,-864;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;748;-3088,-3520;Inherit;True;Property;_NoiseLines;Noise Lines;34;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.GetLocalVarNode;572;16,-2624;Inherit;False;29;SlopeInDeg;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;600;-48,-2544;Inherit;False;Property;_SteepWaterStartDeg;Steep Water Start Deg;66;0;Create;True;0;0;0;False;0;False;15;15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;45;2144,-2576;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;47;1968,-2704;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleTimeNode;301;-560,-1760;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.UnpackScaleNormalNode;309;-624,-1680;Inherit;False;Tangent;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleTimeNode;751;-2864,-3296;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;72;1888,-1712;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;847;1984,-1568;Inherit;False;Property;_SteepWaterStartDeg;Steep Water Start Deg;73;0;Fetch;True;0;0;0;False;0;False;15;15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;780;-2304,-2976;Inherit;True;Property;_TextureSample8;Texture Sample 2;8;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.NormalizeNode;782;-2144,-2640;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;749;-2816,-3440;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;755;-2688,-3312;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;756;-2688,-3152;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;458;-2880,-752;Inherit;False;445;Waterfall Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;375;-2896,-928;Inherit;False;Property;_FoamLinesPow;Foam Lines Pow;42;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;460;-2896,-848;Inherit;False;Property;_FoamLinesPowWaterfall;Foam Lines Pow Waterfall;41;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;438;-2592,-1216;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;781;-2288,-2752;Inherit;False;Property;_ColorVariationDepth;Color Variation Depth;10;0;Create;True;0;0;0;False;0;False;0.054;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;443;-3408,-1168;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0.1;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;573;208,-2624;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;15;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;63;2288,-2688;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;286;288,-3312;Inherit;False;205;Normals;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.DynamicAppendNode;302;-384,-1776;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.NegateNode;322;-416,-1664;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;201;288,-3232;Inherit;False;Property;_Refraction;Refraction;17;0;Create;True;0;0;0;False;1;HEADER(Basic Attributes);False;0.0611961;1;0;0.1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;59;2048,-1920;Inherit;True;Property;_Noise_005;Noise_005;6;0;Create;True;0;0;0;False;0;False;-1;5b7de9f470c626541ae97a4812d5762e;5b7de9f470c626541ae97a4812d5762e;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;78;2048,-1728;Inherit;False;29;SlopeInDeg;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;848;2080,-1664;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;883;-5264,-3344;Inherit;False;Property;_SteepWaterStartDeg;Steep Water Start Deg;73;0;Fetch;True;0;0;0;False;0;False;15;15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ParallaxOffsetHlpNode;783;-1968,-2864;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;757;-2416,-3360;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;758;-2176,-3152;Inherit;False;Property;_NoiseLinesReveal;Noise Lines Reveal;29;0;Create;True;0;0;0;False;0;False;0.8;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;459;-2608,-880;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;431;-2512,-1120;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;560;-2304,-832;Inherit;False;29;SlopeInDeg;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;554;-4848,-448;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;15;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;574;368,-2624;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;40;2400,-2768;Inherit;True;Property;_WaterfallSteepnessLine;;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.UnpackScaleNormalNode;289;592,-3312;Inherit;False;Tangent;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TextureCoordinatesNode;297;-336,-1888;Inherit;False;0;296;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;303;-240,-1776;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;321;-272,-1664;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GrabScreenPosition;193;0,-3440;Inherit;False;0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SmoothstepOpNode;76;2240,-1696;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;45;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;597;2336,-1872;Inherit;False;Voronoi;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;599;-5056,-3408;Inherit;False;29;SlopeInDeg;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;884;-4992,-3344;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;5;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;784;-1712,-2784;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PowerNode;760;-1920,-3168;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;761;-1984,-3264;Inherit;False;Property;_NoiseLinesOpacity;Noise Lines Opacity;26;0;Create;True;0;0;0;False;0;False;0.8;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;440;-2208,-1216;Inherit;False;PA_SF_CheapContrast;-1;;18;91fe25245faae9e47950226a865e2555;0;2;2;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;567;-2096,-784;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;60;False;2;FLOAT;75;False;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;555;-4688,-448;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;575;512,-2624;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;816;2752,-2720;Inherit;False;WaterfallSteepLinesTex;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;203;960,-3376;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;298;0,-1808;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;759;-2240,-3520;Inherit;True;Property;_TextureSample7;Texture Sample 7;39;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;84;2432,-1760;Inherit;False;Property;_SteepVoronoiStep;Steep Voronoi Step;5;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;82;2560,-1872;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;615;-4864,-3408;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;90;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;886;-4960,-3536;Inherit;False;Property;_SteepWaterSmallDotsStep;Steep Water Small Dots Step;59;0;Create;True;0;0;0;False;0;False;0.88;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;887;-4960,-3472;Inherit;False;Property;_FlatWaterSmallDotsStep;Flat Water Small Dots Step;60;0;Create;True;0;0;0;False;0;False;0.6;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;785;-1552,-2944;Inherit;True;Property;_TextureSample9;Texture Sample 3;9;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;786;-1520,-2736;Inherit;False;Property;_ColorVariationContrast;Color Variation Contrast;15;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;762;-1760,-3296;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;559;-1936,-1216;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;566;-1920,-960;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;556;-4544,-448;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.2;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;818;560,-2704;Inherit;False;816;WaterfallSteepLinesTex;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;578;656,-2624;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenDepthNode;292;912,-3088;Inherit;False;2;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SurfaceDepthNode;293;848,-3008;Inherit;False;0;1;0;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;296;128,-1824;Inherit;True;Property;_FoamTexture;Foam Texture;35;0;Create;True;0;0;0;False;0;False;-1;617b206ec808f7041b7a41b2c1373f91;617b206ec808f7041b7a41b2c1373f91;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;904;-5008,-2800;Inherit;False;903;Global Speed;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;668;-5008,-2880;Inherit;False;Property;_CausticsSpeed;Caustics Speed;62;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;849;2560,-1680;Inherit;False;Property;_SteepVoronoiOpacity;Steep Voronoi Opacity;6;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;83;2736,-1872;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;621;-4208,-3456;Inherit;False;Property;_SteepWaterSmallDotsOpacity;Steep Water Small Dots Opacity;57;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;617;-4656,-3536;Inherit;False;3;0;FLOAT;0.88;False;1;FLOAT;0.6;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;598;-4512,-3472;Inherit;False;597;Voronoi;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;889;-4176,-3392;Inherit;False;Property;_FlatWaterSmallDotsOpacity;Flat Water Small Dots Opacity;58;0;Create;False;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;787;-1248,-2864;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;764;-1600,-3296;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;765;-1600,-3216;Inherit;False;Property;_NoiseLinesPow;Noise Lines Pow;25;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;558;-1760,-1120;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;570;-2080,-608;Inherit;False;Property;_FoamLinesOpacity;Foam Lines Opacity;53;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;763;-1072,-3056;Inherit;False;Property;_Color3;Color 1;12;0;Create;True;0;0;0;False;0;False;0,0.8273995,1,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;766;-1072,-3280;Inherit;False;Property;_Color4;Color 2;14;0;Create;True;0;0;0;False;0;False;0,0.5989819,0.8867924,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;571;-2080,-528;Inherit;False;Property;_FoamLinesWaterfall;Foam Lines Waterfall;54;0;Create;True;0;0;0;False;0;False;0.6530934;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;576;816,-2704;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;580;688,-2784;Inherit;False;Property;_SlopeLinesStep;Slope LinesStep;55;0;Create;True;0;0;0;False;0;False;0.368;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;295;1120,-3056;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenColorNode;290;1120,-3264;Inherit;False;Global;_GrabScreen2;Grab Screen 1;49;0;Create;True;0;0;0;False;0;False;Instance;194;False;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenColorNode;194;1168,-3440;Inherit;False;Global;_GrabScreen1;Grab Screen 1;49;0;Create;True;0;0;0;False;0;False;Object;-1;False;False;False;False;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.VertexColorNode;311;-64,-1664;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleSubtractOpNode;313;416,-1776;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;898;-4800,-2880;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;810;-5008,-2720;Inherit;False;473;Cloud Noise;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;88;2880,-1792;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.05;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;888;-3888,-3456;Inherit;False;3;0;FLOAT;0.88;False;1;FLOAT;0.6;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;613;-4320,-3536;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;767;-720,-3120;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.PowerNode;768;-1424,-3296;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;563;-1600,-1056;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;569;-1664,-528;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;769;-1072,-3488;Inherit;False;Property;_Color5;Color 3;13;0;Create;True;0;0;0;False;0;False;0,0.5989819,0.8867924,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.StepOpNode;579;992,-2736;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;582;960,-2640;Inherit;False;Property;_SlopeLinesOpacity;Slope Lines Opacity;56;0;Create;True;0;0;0;False;0;False;0.587;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;291;1536,-3280;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;318;416,-1856;Inherit;False;Property;_FoamHardness;Foam Hardness;38;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;314;576,-1776;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;714;-4656,-2880;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;656;-5008,-3088;Inherit;True;Property;_CausticsTexture;Caustics Texture;61;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.ComponentMaskNode;936;-4768,-2720;Inherit;False;True;True;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;689;-4768,-2640;Inherit;False;Property;_CausticsViewOffset;Caustics View Offset;63;0;Create;True;0;0;0;False;0;False;0.05;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;732;-4256,-2768;Inherit;False;206;Scene Depth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;736;-4256,-2688;Inherit;False;Property;_CausticsDepth;Caustics Depth;65;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;619;-3744,-3536;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;86;3040,-1792;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;770;-624,-3408;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;568;-1456,-944;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;581;1232,-2736;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;800;1696,-3280;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StepOpNode;317;704,-1840;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;207;-832,-992;Inherit;False;206;Scene Depth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;199;-960,-928;Inherit;False;Property;_ColorTransparencyDepthNear;Color Transparency  Depth Near;23;0;Create;False;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;543;-928,-864;Inherit;False;Property;_ColorTransparencyDepthFar;Color Transparency  Depth Far;22;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;712;-4560,-3008;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;715;-4480,-2896;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;937;-4544,-2720;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SmoothstepOpNode;741;-4064,-2752;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;731;-4352,-2608;Inherit;False;Property;_CausticsOpacity;Caustics Opacity;64;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;620;-3584,-3536;Inherit;False;Steep Water Small Dots;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;850;3184,-1792;Inherit;False;Steep Voronoi;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;788;-416,-3408;Inherit;False;Water Color;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;441;-1280,-944;Inherit;False;Foam Lines;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;583;1392,-2736;Inherit;False;Slope Lines;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;801;1904,-3280;Inherit;False;Refracted Background;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;323;816,-1840;Inherit;False;Painted Foam;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;542;-656,-928;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;935;-752,-784;Inherit;False;Property;_ColorMaxOpacity;Color Max Opacity;76;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;713;-4272,-2960;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;738;-3872,-2752;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;178;-4560,-2256;Inherit;False;Property;_NormalsStrength;Normals Strength;21;0;Create;True;0;0;0;False;0;False;0.2;0.2;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;890;-720,352;Inherit;False;850;Steep Voronoi;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;894;-768,432;Inherit;False;620;Steep Water Small Dots;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;789;-432,-1024;Inherit;False;788;Water Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;802;-496,-1088;Inherit;False;801;Refracted Background;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;328;-224,-880;Inherit;False;325;Edge Foam;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;330;-256,-816;Inherit;False;323;Painted Foam;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;442;-224,-752;Inherit;False;441;Foam Lines;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;622;-288,-688;Inherit;False;620;Steep Water Small Dots;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;585;-224,-624;Inherit;False;583;Slope Lines;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;851;-256,-560;Inherit;False;850;Steep Voronoi;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMinOpNode;934;-416,-912;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;692;-4048,-3088;Inherit;True;Property;_TextureSample6;Texture Sample 6;86;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SaturateNode;740;-3728,-2752;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.UnpackScaleNormalNode;177;-4272,-2336;Inherit;False;Tangent;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;1;False;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;864;-576,-304;Inherit;False;788;Water Color;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;867;-672,-224;Inherit;False;Property;_DebugWaterColor;DebugWaterColor;68;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;873;-672,-64;Inherit;False;Property;_DebugNormals;DebugNormals;69;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;871;-576,-144;Inherit;False;205;Normals;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;874;-576,32;Inherit;False;441;Foam Lines;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;876;-672,112;Inherit;False;Property;_DebugFlowLines;DebugFlowLines;70;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;878;-576,192;Inherit;False;325;Edge Foam;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;879;-672,272;Inherit;False;Property;_DebugEdgeFoam;DebugEdgeFoam;71;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;893;-512,384;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;891;-672,512;Inherit;False;Property;_DebugVoronoiFoam;DebugVoronoiFoam;72;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;895;-576,608;Inherit;False;473;Cloud Noise;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;897;-672,688;Inherit;False;Property;_DebugCloudNoise;Debug Cloud Noise;73;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;197;-240,-1040;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;327;-16,-800;Inherit;False;6;6;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;811;-3744,-3072;Inherit;False;Caustics;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;812;-3584,-2752;Inherit;False;Caustics Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;808;-4032,-2336;Inherit;False;Final Normals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;865;-384,-304;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;872;-384,-144;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;875;-384,32;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;880;-384,192;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;892;-384,384;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;896;-384,608;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;241;48,-1008;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;813;208,-1040;Inherit;False;811;Caustics;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;814;208,-944;Inherit;False;812;Caustics Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;590;448,-880;Inherit;False;808;Final Normals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;184;384,-608;Inherit;False;Property;_Smoothness;Smoothness;20;0;Create;True;0;0;0;False;0;False;1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;858;784,-512;Inherit;False;Constant;_Float0;Float 0;69;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;869;480,-800;Inherit;False;Constant;_Vector0;Vector 0;69;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleAddOpNode;870;-80,80;Inherit;False;6;6;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;866;32,-208;Inherit;False;Constant;_Float2;Float 2;71;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.BlendOpsNode;730;448,-1024;Inherit;False;Screen;True;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;397;-4592,-1248;Inherit;False;Constant;_Randomnormalizedperstrip;Random normalized per strip;51;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;856;784,-896;Inherit;False;Property;_DEBUG1;DEBUG;67;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;855;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;857;784,-608;Inherit;False;Property;_DEBUG2;DEBUG;67;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;855;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;859;768,-416;Inherit;False;Property;_DEBUG3;DEBUG;67;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;855;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;855;784,-1024;Inherit;False;Property;_DEBUG;DEBUG;67;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;868;192,-192;Inherit;False;Property;_DEBUG5;DEBUG;67;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;855;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;938;1072,-976;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;939;1072,-976;Float;False;True;-1;3;UnityEditor.ShaderGraphLitGUI;0;12;Polyart/Dreamscape/Water/River;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;;0;0;Standard;43;Lighting Model;0;0;Workflow;1;638808480241969764;Surface;1;638808478621275542;  Refraction Model;0;638808479244378393;  Blend;0;0;Two Sided;1;0;Alpha Clipping;0;638808480303230286;  Use Shadow Threshold;0;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;1;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;638808480554990011;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;Receive Shadows;1;0;Receive SSAO;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;940;1072,-976;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;941;1072,-976;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;942;1072,-976;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;943;1072,-976;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;944;1072,-976;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;945;1072,-976;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;946;1072,-976;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;947;1072,-976;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
WireConnection;903;0;899;0
WireConnection;232;0;231;1
WireConnection;907;0;791;0
WireConnection;907;1;909;0
WireConnection;234;0;232;0
WireConnection;793;0;907;0
WireConnection;233;0;234;0
WireConnection;792;2;790;0
WireConnection;796;1;793;0
WireConnection;236;0;233;0
WireConnection;797;0;792;0
WireConnection;797;1;796;0
WireConnection;798;0;790;0
WireConnection;798;1;797;0
WireConnection;798;7;790;1
WireConnection;253;0;252;0
WireConnection;253;1;221;0
WireConnection;473;0;798;0
WireConnection;254;0;253;0
WireConnection;261;0;254;0
WireConnection;261;2;214;0
WireConnection;262;0;261;0
WireConnection;247;0;245;0
WireConnection;246;0;262;0
WireConnection;246;1;225;0
WireConnection;242;0;247;0
WireConnection;244;0;242;0
WireConnection;244;1;246;0
WireConnection;187;0;185;0
WireConnection;187;1;186;4
WireConnection;248;0;244;0
WireConnection;206;0;187;0
WireConnection;745;0;248;0
WireConnection;745;1;744;0
WireConnection;269;0;745;0
WireConnection;269;1;270;0
WireConnection;926;0;925;0
WireConnection;926;1;928;0
WireConnection;325;0;269;0
WireConnection;833;0;832;0
WireConnection;929;0;926;0
WireConnection;834;0;833;0
WireConnection;834;2;928;0
WireConnection;836;0;326;0
WireConnection;932;0;929;0
WireConnection;932;1;834;0
WireConnection;933;0;836;0
WireConnection;933;1;932;0
WireConnection;839;0;933;0
WireConnection;589;0;586;0
WireConnection;587;0;589;0
WireConnection;595;0;587;1
WireConnection;596;0;595;0
WireConnection;30;0;596;0
WireConnection;29;0;30;0
WireConnection;444;0;29;0
WireConnection;445;0;444;0
WireConnection;334;0;333;0
WireConnection;447;0;337;0
WireConnection;447;1;446;0
WireConnection;447;2;448;0
WireConnection;336;0;334;0
WireConnection;336;1;447;0
WireConnection;335;0;336;0
WireConnection;349;1;339;0
WireConnection;332;0;331;0
WireConnection;332;1;335;0
WireConnection;350;0;349;0
WireConnection;352;0;339;0
WireConnection;348;0;332;0
WireConnection;348;1;350;0
WireConnection;351;0;348;0
WireConnection;351;1;352;0
WireConnection;353;0;351;0
WireConnection;405;0;353;0
WireConnection;392;0;405;0
WireConnection;549;0;356;0
WireConnection;549;1;452;0
WireConnection;429;0;392;0
WireConnection;557;1;545;0
WireConnection;430;0;429;0
WireConnection;547;0;356;0
WireConnection;547;1;549;0
WireConnection;547;2;557;0
WireConnection;623;0;413;0
WireConnection;623;1;624;0
WireConnection;623;2;557;0
WireConnection;394;0;392;0
WireConnection;548;0;356;0
WireConnection;548;1;547;0
WireConnection;409;0;430;0
WireConnection;415;0;623;0
WireConnection;414;0;623;0
WireConnection;393;0;394;0
WireConnection;408;0;409;0
WireConnection;408;1;548;0
WireConnection;402;0;401;2
WireConnection;410;0;393;0
WireConnection;410;3;415;0
WireConnection;410;4;414;0
WireConnection;901;0;905;0
WireConnection;901;1;160;0
WireConnection;902;0;408;0
WireConnection;902;1;906;0
WireConnection;407;0;902;0
WireConnection;404;0;402;0
WireConnection;404;1;410;0
WireConnection;425;0;393;0
WireConnection;823;0;901;0
WireConnection;827;0;826;0
WireConnection;338;0;332;0
WireConnection;338;1;339;0
WireConnection;553;0;404;0
WireConnection;553;1;407;0
WireConnection;426;0;425;0
WireConnection;820;2;148;0
WireConnection;824;1;823;0
WireConnection;828;0;827;0
WireConnection;828;1;175;0
WireConnection;340;0;338;0
WireConnection;400;0;553;0
WireConnection;420;0;426;0
WireConnection;822;0;820;0
WireConnection;822;1;824;0
WireConnection;822;2;828;0
WireConnection;423;0;420;0
WireConnection;416;0;400;0
WireConnection;416;1;420;0
WireConnection;341;0;340;0
WireConnection;427;0;392;0
WireConnection;821;0;148;0
WireConnection;821;1;822;0
WireConnection;821;7;148;1
WireConnection;912;0;74;0
WireConnection;912;1;914;0
WireConnection;918;0;772;0
WireConnection;918;1;919;0
WireConnection;50;0;46;0
WireConnection;68;0;912;0
WireConnection;428;0;427;0
WireConnection;422;1;423;0
WireConnection;417;0;416;0
WireConnection;342;0;341;0
WireConnection;462;0;463;0
WireConnection;462;1;464;0
WireConnection;462;2;557;0
WireConnection;205;0;821;0
WireConnection;300;0;299;0
WireConnection;775;0;918;0
WireConnection;915;0;50;0
WireConnection;915;1;917;0
WireConnection;69;0;68;0
WireConnection;807;0;806;0
WireConnection;773;2;771;0
WireConnection;777;1;775;0
WireConnection;343;0;342;0
WireConnection;411;0;462;0
WireConnection;411;1;428;0
WireConnection;421;0;417;0
WireConnection;421;1;422;0
WireConnection;44;0;915;0
WireConnection;910;0;911;0
WireConnection;910;1;300;0
WireConnection;920;0;746;0
WireConnection;920;1;921;0
WireConnection;98;0;99;0
WireConnection;98;1;807;0
WireConnection;71;2;65;0
WireConnection;70;1;69;0
WireConnection;778;0;773;0
WireConnection;778;1;777;0
WireConnection;752;0;747;0
WireConnection;412;0;421;0
WireConnection;412;1;411;0
WireConnection;432;0;343;0
WireConnection;455;0;436;0
WireConnection;455;1;456;0
WireConnection;455;2;557;0
WireConnection;45;1;44;0
WireConnection;47;2;62;0
WireConnection;301;0;910;0
WireConnection;309;0;306;0
WireConnection;309;1;310;0
WireConnection;751;0;920;0
WireConnection;72;0;71;0
WireConnection;72;1;70;0
WireConnection;72;2;98;0
WireConnection;780;0;771;0
WireConnection;780;1;778;0
WireConnection;780;7;771;1
WireConnection;782;0;779;0
WireConnection;749;2;748;0
WireConnection;755;1;751;0
WireConnection;756;0;752;0
WireConnection;756;1;753;0
WireConnection;438;0;412;0
WireConnection;438;1;439;0
WireConnection;443;0;432;0
WireConnection;443;1;455;0
WireConnection;573;0;572;0
WireConnection;573;1;600;0
WireConnection;63;0;47;0
WireConnection;63;1;45;0
WireConnection;302;1;301;0
WireConnection;322;0;309;1
WireConnection;59;0;65;0
WireConnection;59;1;72;0
WireConnection;59;7;65;1
WireConnection;848;0;847;0
WireConnection;783;0;780;2
WireConnection;783;1;781;0
WireConnection;783;2;782;0
WireConnection;757;0;749;0
WireConnection;757;1;755;0
WireConnection;757;2;756;0
WireConnection;459;0;375;0
WireConnection;459;1;460;0
WireConnection;459;2;458;0
WireConnection;431;0;438;0
WireConnection;431;1;443;0
WireConnection;554;0;545;0
WireConnection;574;0;573;0
WireConnection;40;0;62;0
WireConnection;40;1;63;0
WireConnection;40;7;62;1
WireConnection;289;0;286;0
WireConnection;289;1;201;0
WireConnection;303;1;302;0
WireConnection;321;0;322;0
WireConnection;76;0;78;0
WireConnection;76;1;848;0
WireConnection;76;2;847;0
WireConnection;597;0;59;1
WireConnection;884;0;883;0
WireConnection;784;0;783;0
WireConnection;784;1;778;0
WireConnection;760;0;780;2
WireConnection;760;1;758;0
WireConnection;440;2;431;0
WireConnection;440;1;459;0
WireConnection;567;0;560;0
WireConnection;555;0;554;0
WireConnection;575;0;574;0
WireConnection;816;0;40;1
WireConnection;203;0;193;0
WireConnection;203;1;289;0
WireConnection;298;0;297;0
WireConnection;298;1;303;0
WireConnection;298;2;321;0
WireConnection;759;0;748;0
WireConnection;759;1;757;0
WireConnection;759;7;748;1
WireConnection;82;0;597;0
WireConnection;82;1;76;0
WireConnection;615;0;599;0
WireConnection;615;1;883;0
WireConnection;615;2;884;0
WireConnection;785;0;771;0
WireConnection;785;1;784;0
WireConnection;785;7;771;1
WireConnection;762;0;759;2
WireConnection;762;1;761;0
WireConnection;762;2;760;0
WireConnection;559;0;440;0
WireConnection;566;0;567;0
WireConnection;556;0;555;0
WireConnection;578;0;575;0
WireConnection;292;0;203;0
WireConnection;296;1;298;0
WireConnection;83;0;84;0
WireConnection;83;1;82;0
WireConnection;617;0;886;0
WireConnection;617;1;887;0
WireConnection;617;2;615;0
WireConnection;787;0;785;2
WireConnection;787;1;786;0
WireConnection;764;0;762;0
WireConnection;558;0;559;0
WireConnection;558;1;556;0
WireConnection;558;2;566;0
WireConnection;576;0;818;0
WireConnection;576;1;578;0
WireConnection;295;0;293;0
WireConnection;295;1;292;0
WireConnection;290;0;203;0
WireConnection;194;0;193;0
WireConnection;313;0;296;1
WireConnection;898;0;668;0
WireConnection;898;1;904;0
WireConnection;88;0;83;0
WireConnection;88;1;849;0
WireConnection;888;0;621;0
WireConnection;888;1;889;0
WireConnection;888;2;615;0
WireConnection;613;0;617;0
WireConnection;613;1;598;0
WireConnection;767;0;766;5
WireConnection;767;1;763;5
WireConnection;767;2;787;0
WireConnection;768;0;764;0
WireConnection;768;1;765;0
WireConnection;563;0;558;0
WireConnection;569;0;570;0
WireConnection;569;1;571;0
WireConnection;569;2;557;0
WireConnection;579;0;580;0
WireConnection;579;1;576;0
WireConnection;291;0;194;0
WireConnection;291;1;290;0
WireConnection;291;2;295;0
WireConnection;314;0;313;0
WireConnection;314;1;311;1
WireConnection;714;0;898;0
WireConnection;936;0;810;0
WireConnection;619;0;613;0
WireConnection;619;1;888;0
WireConnection;86;0;88;0
WireConnection;770;0;767;0
WireConnection;770;1;769;5
WireConnection;770;2;768;0
WireConnection;568;0;563;0
WireConnection;568;1;569;0
WireConnection;581;0;579;0
WireConnection;581;1;582;0
WireConnection;800;0;291;0
WireConnection;317;0;318;0
WireConnection;317;1;314;0
WireConnection;712;2;656;0
WireConnection;715;1;714;0
WireConnection;937;0;936;0
WireConnection;937;1;689;0
WireConnection;741;0;732;0
WireConnection;741;1;736;0
WireConnection;620;0;619;0
WireConnection;850;0;86;0
WireConnection;788;0;770;0
WireConnection;441;0;568;0
WireConnection;583;0;581;0
WireConnection;801;0;800;0
WireConnection;323;0;317;0
WireConnection;542;0;207;0
WireConnection;542;1;199;0
WireConnection;542;2;543;0
WireConnection;713;0;712;0
WireConnection;713;1;715;0
WireConnection;713;2;937;0
WireConnection;738;0;741;0
WireConnection;738;1;731;0
WireConnection;934;0;542;0
WireConnection;934;1;935;0
WireConnection;692;0;656;0
WireConnection;692;1;713;0
WireConnection;740;0;738;0
WireConnection;177;0;205;0
WireConnection;177;1;178;0
WireConnection;893;0;890;0
WireConnection;893;1;894;0
WireConnection;197;0;802;0
WireConnection;197;1;789;0
WireConnection;197;2;934;0
WireConnection;327;0;328;0
WireConnection;327;1;330;0
WireConnection;327;2;442;0
WireConnection;327;3;622;0
WireConnection;327;4;585;0
WireConnection;327;5;851;0
WireConnection;811;0;692;5
WireConnection;812;0;740;0
WireConnection;808;0;177;0
WireConnection;865;0;864;0
WireConnection;865;1;867;0
WireConnection;872;0;871;0
WireConnection;872;1;873;0
WireConnection;875;0;874;0
WireConnection;875;1;876;0
WireConnection;880;0;878;0
WireConnection;880;1;879;0
WireConnection;892;0;893;0
WireConnection;892;1;891;0
WireConnection;896;0;895;0
WireConnection;896;1;897;0
WireConnection;241;0;197;0
WireConnection;241;2;327;0
WireConnection;870;0;865;0
WireConnection;870;1;872;0
WireConnection;870;2;875;0
WireConnection;870;3;880;0
WireConnection;870;4;892;0
WireConnection;870;5;896;0
WireConnection;730;0;813;0
WireConnection;730;1;241;0
WireConnection;730;2;814;0
WireConnection;856;1;590;0
WireConnection;856;0;869;0
WireConnection;857;1;184;0
WireConnection;857;0;858;0
WireConnection;859;1;840;0
WireConnection;859;0;860;0
WireConnection;855;1;730;0
WireConnection;855;0;858;0
WireConnection;868;1;866;0
WireConnection;868;0;870;0
WireConnection;939;0;855;0
WireConnection;939;1;856;0
WireConnection;939;2;868;0
WireConnection;939;4;857;0
WireConnection;939;6;859;0
ASEEND*/
//CHKSM=29C4FAD43D974DD788C876C1FFBEE6B69D44C0D5