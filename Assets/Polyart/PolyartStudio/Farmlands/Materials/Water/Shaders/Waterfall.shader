// Made with Amplify Shader Editor v1.9.8.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "NewWaterfall"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_WaterfallStartNoise("Waterfall Start Noise", 2D) = "white" {}
		_WaterfallStartNoiseSpeed("Waterfall Start Noise Speed", Float) = 0.2842633
		_WaterfallStartNoisePosition("Waterfall Start Noise Position", Range( 0 , 1)) = 0.22
		_WaterfallStartNoiseOpacity("Waterfall Start Noise Opacity", Range( 0 , 1)) = 0.22
		_WaterfallStartNoiseExtend("Waterfall Start Noise Extend", Range( 0 , 1)) = 0.22
		_WaterfallStartNoisePow("Waterfall Start Noise Pow", Range( 0 , 1)) = 1
		_CloudNoiseSpeed("Cloud Noise Speed", Float) = -0.1
		_CloudNoise("Cloud Noise", 2D) = "white" {}
		_WaterfallStartNoiseDistortion("Waterfall Start Noise Distortion", Range( 0 , 0.3)) = 0.037
		_WaterfallStartNoiseDepth("Waterfall Start Noise Depth", Range( 0 , 1)) = 0.037
		_ColorVariationSpeed("Color Variation Speed", Float) = -0.1
		_ColorVariationTexture("Color Variation Texture", 2D) = "white" {}
		_ColorVariationDepth("Color Variation Depth", Range( 0 , 1)) = 0.054
		_Color1("Color 1", Color) = (0,0.8273995,1,0)
		_Color3("Color 3", Color) = (0,0.5989819,0.8867924,0)
		_Color4("Color 4", Color) = (0,0.5989819,0.8867924,0)
		_Color2("Color 2", Color) = (0,0.5989819,0.8867924,0)
		_ColorVariationContrast("Color Variation Contrast", Float) = 1
		_WaterfallEdgeSpeed("Waterfall Edge Speed", Float) = 0.2
		_WaterfallEdge("Waterfall Edge", 2D) = "white" {}
		_WaterfallEdgeFoamOpacity("Waterfall Edge Foam Opacity", Range( 0 , 1)) = 0.5
		_TopVoronoi("Top Voronoi", 2D) = "white" {}
		_SmallDots1Scale("Small Dots 1 Scale", Vector) = (1,1,0,0)
		_SmallDots2Scale("Small Dots 2 Scale", Vector) = (1,1,0,0)
		_SmallDots2Speed("Small Dots 2 Speed", Float) = -0.1
		_SmallDots1Speed("Small Dots 1 Speed", Float) = -0.1
		_SmallDots1Step("Small Dots 1 Step", Range( 0 , 1)) = 0.8
		_SmallDots2Step("Small Dots 2 Step", Range( 0 , 1)) = 0.8
		_SmallDots1Opacity("Small Dots 1 Opacity", Range( 0 , 1)) = 0.8
		_SmallDots2Opacity("Small Dots 2 Opacity", Range( 0 , 1)) = 0.8
		_SmallDots1Distortion("Small Dots 1 Distortion", Range( 0 , 0.2)) = 0.045
		_SmallDots2Distortion("Small Dots 2 Distortion", Range( 0 , 0.2)) = 0.045
		_NoiseLinesPow("Noise Lines Pow", Float) = 1
		_NoiseLinesOpacity("Noise Lines Opacity", Float) = 0.8
		_NoiseLinesReveal("Noise Lines Reveal", Float) = 0.8
		_NoiseLinesDistortion("Noise Lines Distortion", Range( 0 , 0.3)) = 0.042
		_NoiseLinesSpeed("Noise Lines Speed", Float) = -0.2
		_NoiseLines("Noise Lines", 2D) = "white" {}
		_BottomFoamSpeed("Bottom Foam Speed", Float) = -0.1
		_BottomFoamWidthPow("Bottom Foam Width Pow", Float) = 0
		_BottomFoamExtendMin("Bottom Foam Extend Min", Float) = 0
		_BottomFoamExtendMax("Bottom Foam Extend Max", Range( 0 , 1)) = 0.15
		_BottomFoamStep("Bottom Foam Step", Range( 0 , 1)) = 0.5
		_BottomFoamDistortion("Bottom Foam Distortion", Range( 0 , 0.3)) = 0.05
		_StartNoiseHarshTiling("Start Noise Harsh Tiling", Vector) = (1,1,0,0)
		_StartNoiseHarshSpeed("Start Noise Harsh Speed", Float) = -1
		_StartNoiseHarshDistortion("Start Noise Harsh Distortion", Range( 0 , 0.2)) = 0.026
		_StartNoiseharshTopPosition("Start Noise harsh Top Position", Range( 0 , 1)) = 0.24
		_StartNoiseharshBottomPosition("Start Noise harsh Bottom Position", Range( 0 , 1)) = 0.4435484
		_StartNoiseharshTopBlend("Start Noise harsh Top Blend", Range( 0 , 0.5)) = 0.07522548
		_StartNoiseharshBottomBlend("Start Noise harsh Bottom Blend", Range( 0 , 0.5)) = 0.07522548
		_StartNoiseHarshStep("Start Noise Harsh Step", Range( 0 , 1)) = 0.51
		_InitialOpacityGradience("Initial Opacity Gradience", Float) = 10
		_BottomOpacityCutout("Bottom Opacity Cutout", Range( 0 , 1)) = 0.9
		_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_NormalStrength("Normal Strength", Float) = 1
		[Toggle(_DEBUG_ON)] _DEBUG("DEBUG", Float) = 0
		_DebugWaterColor("DebugWaterColor", Range( 0 , 1)) = 0
		_DebugNormals("DebugNormals", Range( 0 , 1)) = 0
		_DebugCloudNoise("Debug Cloud Noise", Range( 0 , 1)) = 0
		_EdgeFoamDistance("Edge Foam Distance", Float) = 1
		_EdgeFoamOpacity("Edge Foam Opacity", Float) = 1
		_EdgeFoamStep("Edge Foam Step", Range( 0 , 1)) = 0.1


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
			Tags { "LightMode"="UniversalForward" }

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

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
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
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color2;
			float4 _ColorVariationTexture_TexelSize;
			float4 _WaterfallStartNoise_ST;
			float4 _Color4;
			float4 _CloudNoise_ST;
			float4 _NoiseLines_ST;
			float4 _WaterfallEdge_ST;
			float4 _Color3;
			float4 _ColorVariationTexture_ST;
			float4 _Color1;
			float2 _StartNoiseHarshTiling;
			float2 _SmallDots2Scale;
			float2 _SmallDots1Scale;
			float _NormalStrength;
			float _SmallDots1Distortion;
			float _SmallDots1Opacity;
			float _StartNoiseHarshStep;
			float _Smoothness;
			float _StartNoiseHarshSpeed;
			float _StartNoiseHarshDistortion;
			float _StartNoiseharshTopPosition;
			float _StartNoiseharshTopBlend;
			float _StartNoiseharshBottomPosition;
			float _StartNoiseharshBottomBlend;
			float _SmallDots2Step;
			float _DebugCloudNoise;
			float _SmallDots1Speed;
			float _SmallDots2Distortion;
			float _SmallDots2Opacity;
			float _EdgeFoamStep;
			float _DebugNormals;
			float _EdgeFoamDistance;
			float _EdgeFoamOpacity;
			float _DebugWaterColor;
			float _SmallDots2Speed;
			float _ColorVariationContrast;
			float _WaterfallEdgeFoamOpacity;
			float _NoiseLinesSpeed;
			float _ColorVariationDepth;
			float _CloudNoiseSpeed;
			float _NoiseLinesDistortion;
			float _NoiseLinesOpacity;
			float _NoiseLinesReveal;
			float _NoiseLinesPow;
			float _ColorVariationSpeed;
			float _WaterfallStartNoiseSpeed;
			float _WaterfallStartNoiseDistortion;
			float _WaterfallStartNoiseDepth;
			float _WaterfallStartNoiseExtend;
			float _WaterfallStartNoisePow;
			float _WaterfallStartNoisePosition;
			float _WaterfallStartNoiseOpacity;
			float _BottomFoamStep;
			float _BottomFoamSpeed;
			float _BottomFoamDistortion;
			float _BottomFoamExtendMax;
			float _BottomFoamExtendMin;
			float _BottomFoamWidthPow;
			float _InitialOpacityGradience;
			float _WaterfallEdgeSpeed;
			float _SmallDots1Step;
			float _BottomOpacityCutout;
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

			sampler2D _ColorVariationTexture;
			sampler2D _NoiseLines;
			sampler2D _CloudNoise;
			sampler2D _WaterfallStartNoise;
			sampler2D _WaterfallEdge;
			sampler2D _TopVoronoi;


			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			
			void CalculateUVsSmooth46_g2( float2 UV, float4 TexelSize, out float2 UV0, out float2 UV1, out float2 UV2, out float2 UV3, out float2 UV4, out float2 UV5, out float2 UV6, out float2 UV7, out float2 UV8 )
			{
				{
				    float3 pos = float3( TexelSize.xy, 0 );
				    float3 neg = float3( -pos.xy, 0 );
				    UV0 = UV + neg.xy;
				    UV1 = UV + neg.zy;
				    UV2 = UV + float2( pos.x, neg.y );
				    UV3 = UV + neg.xz;
				    UV4 = UV;
				    UV5 = UV + pos.xz;
				    UV6 = UV + float2( neg.x, pos.y );
				    UV7 = UV + pos.zy;
				    UV8 = UV + pos.xy;
				    return;
				}
			}
			
			float3 CombineSamplesSmooth58_g2( float Strength, float S0, float S1, float S2, float S3, float S4, float S5, float S6, float S7, float S8 )
			{
				{
				    float3 normal;
				    normal.x = Strength * ( S0 - S2 + 2 * S3 - 2 * S5 + S6 - S8 );
				    normal.y = Strength * ( S0 + 2 * S1 + S2 - S6 - 2 * S7 - S8 );
				    normal.z = 1.0;
				    return normalize( normal );
				}
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				output.ase_texcoord8.xy = input.texcoord.xy;
				
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

				float2 uv_ColorVariationTexture = input.ase_texcoord8.xy * _ColorVariationTexture_ST.xy + _ColorVariationTexture_ST.zw;
				float mulTime52 = _TimeParameters.x * _ColorVariationSpeed;
				float2 appendResult54 = (float2(0.0 , mulTime52));
				float2 temp_output_55_0 = ( uv_ColorVariationTexture + appendResult54 );
				float4 tex2DNode48 = tex2D( _ColorVariationTexture, temp_output_55_0 );
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 ase_viewVectorTS =  tanToWorld0 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).x + tanToWorld1 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).y  + tanToWorld2 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).z;
				float3 normalizeResult59 = normalize( ase_viewVectorTS );
				float2 paralaxOffset47 = ParallaxOffset( tex2DNode48.g , _ColorVariationDepth , normalizeResult59 );
				float4 tex2DNode57 = tex2D( _ColorVariationTexture, ( paralaxOffset47 + temp_output_55_0 ) );
				float4 lerpResult62 = lerp( _Color2 , _Color1 , pow( tex2DNode57.g , _ColorVariationContrast ));
				float2 uv_NoiseLines = input.ase_texcoord8.xy * _NoiseLines_ST.xy + _NoiseLines_ST.zw;
				float mulTime188 = _TimeParameters.x * _NoiseLinesSpeed;
				float2 appendResult190 = (float2(0.0 , mulTime188));
				float2 uv_CloudNoise = input.ase_texcoord8.xy * _CloudNoise_ST.xy + _CloudNoise_ST.zw;
				float mulTime32 = _TimeParameters.x * _CloudNoiseSpeed;
				float2 appendResult33 = (float2(mulTime32 , 0.0));
				float4 Cloud_Noise37 = tex2D( _CloudNoise, ( uv_CloudNoise + appendResult33 ) );
				float4 lerpResult199 = lerp( lerpResult62 , _Color3 , pow( saturate( ( tex2D( _NoiseLines, ( uv_NoiseLines + appendResult190 + ( (Cloud_Noise37).rg * _NoiseLinesDistortion ) ) ).g * _NoiseLinesOpacity * pow( tex2DNode48.g , _NoiseLinesReveal ) ) ) , _NoiseLinesPow ));
				float2 uv_WaterfallStartNoise = input.ase_texcoord8.xy * _WaterfallStartNoise_ST.xy + _WaterfallStartNoise_ST.zw;
				float mulTime3 = _TimeParameters.x * _WaterfallStartNoiseSpeed;
				float2 appendResult5 = (float2(0.0 , mulTime3));
				float2 temp_output_6_0 = ( uv_WaterfallStartNoise + appendResult5 + ( (Cloud_Noise37).rg * _WaterfallStartNoiseDistortion ) );
				float3 normalizeResult236 = normalize( ase_viewVectorTS );
				float2 paralaxOffset234 = ParallaxOffset( tex2D( _WaterfallStartNoise, temp_output_6_0 ).g , _WaterfallStartNoiseDepth , normalizeResult236 );
				float2 texCoord17 = input.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult19 = smoothstep( _WaterfallStartNoiseExtend , _WaterfallStartNoisePow , abs( ( texCoord17.y - _WaterfallStartNoisePosition ) ));
				float4 lerpResult238 = lerp( lerpResult199 , float4( _Color4.rgb , 0.0 ) , saturate( ( tex2D( _WaterfallStartNoise, ( temp_output_6_0 + paralaxOffset234 ) ).g * ( smoothstepResult19 * _WaterfallStartNoiseOpacity ) ) ));
				float4 Water_Color73 = lerpResult238;
				float mulTime252 = _TimeParameters.x * _BottomFoamSpeed;
				float2 appendResult254 = (float2(0.0 , mulTime252));
				float2 texCoord257 = input.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult258 = smoothstep( _BottomFoamExtendMax , _BottomFoamExtendMin , ( 1.0 - texCoord257.y ));
				float Bottom_Foam264 = step( _BottomFoamStep , ( tex2D( _WaterfallStartNoise, ( uv_WaterfallStartNoise + appendResult254 + ( (Cloud_Noise37).rg * _BottomFoamDistortion ) ) ).g * smoothstepResult258 * pow( ( 1.0 - ( abs( ( texCoord257.x - 0.5 ) ) * 2.0 ) ) , _BottomFoamWidthPow ) ) );
				float2 uv_WaterfallEdge = input.ase_texcoord8.xy * _WaterfallEdge_ST.xy + _WaterfallEdge_ST.zw;
				float mulTime79 = _TimeParameters.x * -_WaterfallEdgeSpeed;
				float2 appendResult81 = (float2(0.0 , mulTime79));
				float4 tex2DNode83 = tex2D( _WaterfallEdge, ( uv_WaterfallEdge + appendResult81 ) );
				float Watefal_Edge87 = ( step( 0.6 , tex2DNode83.r ) * _WaterfallEdgeFoamOpacity );
				float2 texCoord129 = input.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime133 = _TimeParameters.x * _SmallDots1Speed;
				float2 appendResult134 = (float2(0.0 , mulTime133));
				float Small_Dots_1139 = ( step( _SmallDots1Step , tex2D( _TopVoronoi, ( ( texCoord129 * _SmallDots1Scale ) + appendResult134 + ( ( (Cloud_Noise37).rg - float2( 0.5,0.5 ) ) * _SmallDots1Distortion ) + float2( 0.32,0.27 ) ) ).g ) * _SmallDots1Opacity );
				float2 texCoord290 = input.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime295 = _TimeParameters.x * _StartNoiseHarshSpeed;
				float2 appendResult296 = (float2(0.0 , mulTime295));
				float smoothstepResult303 = smoothstep( _StartNoiseharshTopPosition , ( _StartNoiseharshTopPosition + _StartNoiseharshTopBlend ) , texCoord290.y);
				float smoothstepResult304 = smoothstep( _StartNoiseharshBottomPosition , ( _StartNoiseharshBottomPosition + _StartNoiseharshBottomBlend ) , texCoord290.y);
				float Start_Noise_Harsh316 = step( _StartNoiseHarshStep , ( tex2D( _WaterfallStartNoise, ( ( texCoord290 * _StartNoiseHarshTiling ) + appendResult296 + ( (Cloud_Noise37).rg * _StartNoiseHarshDistortion ) ) ).g * ( smoothstepResult303 * ( 1.0 - smoothstepResult304 ) ) ) );
				float2 texCoord154 = input.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime156 = _TimeParameters.x * _SmallDots2Speed;
				float2 appendResult161 = (float2(0.0 , mulTime156));
				float Small_Dots_2168 = ( step( _SmallDots2Step , tex2D( _TopVoronoi, ( ( texCoord154 * _SmallDots2Scale ) + appendResult161 + ( ( (Cloud_Noise37).rg - float2( 0.5,0.5 ) ) * _SmallDots2Distortion ) ) ).g ) * _SmallDots2Opacity );
				float4 ase_positionSSNorm = ScreenPos / ScreenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float depthLinearEye370 = LinearEyeDepth( SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_positionSSNorm.xy ), _ZBufferParams );
				float Scene_Depth372 = ( depthLinearEye370 - ScreenPos.w );
				float Edge_Foam382 = ( step( _EdgeFoamStep , saturate( ( saturate( ( ( ( Scene_Depth372 - _EdgeFoamDistance ) / _EdgeFoamDistance ) * -1.0 ) ) * tex2DNode57.g ) ) ) * _EdgeFoamOpacity );
				float Foam_Mask71 = max( max( max( Bottom_Foam264 , Watefal_Edge87 ) , Small_Dots_1139 ) , max( max( Start_Noise_Harsh316 , Small_Dots_2168 ) , Edge_Foam382 ) );
				float4 lerpResult67 = lerp( Water_Color73 , float4( 1,1,1,0 ) , Foam_Mask71);
				float4 temp_cast_1 = (0.0).xxxx;
				#ifdef _DEBUG_ON
				float4 staticSwitch358 = temp_cast_1;
				#else
				float4 staticSwitch358 = lerpResult67;
				#endif
				
				float temp_output_91_0_g2 = _NormalStrength;
				float Strength58_g2 = temp_output_91_0_g2;
				float localCalculateUVsSmooth46_g2 = ( 0.0 );
				float2 temp_output_85_0_g2 = temp_output_55_0;
				float2 UV46_g2 = temp_output_85_0_g2;
				float4 TexelSize46_g2 = _ColorVariationTexture_TexelSize;
				float2 UV046_g2 = float2( 0,0 );
				float2 UV146_g2 = float2( 0,0 );
				float2 UV246_g2 = float2( 0,0 );
				float2 UV346_g2 = float2( 0,0 );
				float2 UV446_g2 = float2( 0,0 );
				float2 UV546_g2 = float2( 0,0 );
				float2 UV646_g2 = float2( 0,0 );
				float2 UV746_g2 = float2( 0,0 );
				float2 UV846_g2 = float2( 0,0 );
				CalculateUVsSmooth46_g2( UV46_g2 , TexelSize46_g2 , UV046_g2 , UV146_g2 , UV246_g2 , UV346_g2 , UV446_g2 , UV546_g2 , UV646_g2 , UV746_g2 , UV846_g2 );
				float4 break140_g2 = tex2D( _ColorVariationTexture, UV046_g2 );
				float S058_g2 = break140_g2.g;
				float4 break142_g2 = tex2D( _ColorVariationTexture, UV146_g2 );
				float S158_g2 = break142_g2.g;
				float4 break146_g2 = tex2D( _ColorVariationTexture, UV246_g2 );
				float S258_g2 = break146_g2.g;
				float4 break148_g2 = tex2D( _ColorVariationTexture, UV346_g2 );
				float S358_g2 = break148_g2.g;
				float4 break150_g2 = tex2D( _ColorVariationTexture, UV446_g2 );
				float S458_g2 = break150_g2.g;
				float4 break152_g2 = tex2D( _ColorVariationTexture, UV546_g2 );
				float S558_g2 = break152_g2.g;
				float4 break154_g2 = tex2D( _ColorVariationTexture, UV646_g2 );
				float S658_g2 = break154_g2.g;
				float4 break156_g2 = tex2D( _ColorVariationTexture, UV746_g2 );
				float S758_g2 = break156_g2.g;
				float4 break158_g2 = tex2D( _ColorVariationTexture, UV846_g2 );
				float S858_g2 = break158_g2.g;
				float3 localCombineSamplesSmooth58_g2 = CombineSamplesSmooth58_g2( Strength58_g2 , S058_g2 , S158_g2 , S258_g2 , S358_g2 , S458_g2 , S558_g2 , S658_g2 , S758_g2 , S858_g2 );
				float3 Normals366 = localCombineSamplesSmooth58_g2;
				#ifdef _DEBUG_ON
				float3 staticSwitch364 = float3(0,0,1);
				#else
				float3 staticSwitch364 = Normals366;
				#endif
				
				float4 temp_cast_3 = (0.0).xxxx;
				#ifdef _DEBUG_ON
				float4 staticSwitch357 = ( ( Water_Color73 * _DebugWaterColor ) + float4( ( Normals366 * _DebugNormals ) , 0.0 ) + ( Cloud_Noise37 * _DebugCloudNoise ) );
				#else
				float4 staticSwitch357 = temp_cast_3;
				#endif
				
				#ifdef _DEBUG_ON
				float staticSwitch362 = 0.0;
				#else
				float staticSwitch362 = _Smoothness;
				#endif
				
				float Opacity93 = step( 0.1 , tex2DNode83.r );
				float2 texCoord317 = input.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DEBUG_ON
				float staticSwitch360 = 1.0;
				#else
				float staticSwitch360 = ( Opacity93 * saturate( ( texCoord317.y * _InitialOpacityGradience ) ) * ( 1.0 - step( _BottomOpacityCutout , texCoord317.y ) ) );
				#endif
				

				float3 BaseColor = staticSwitch358.rgb;
				float3 Normal = staticSwitch364;
				float3 Emission = staticSwitch357.rgb;
				float3 Specular = 0.5;
				float Metallic = 0;
				float Smoothness = staticSwitch362;
				float Occlusion = 1;
				float Alpha = staticSwitch360;
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
			float4 _Color2;
			float4 _ColorVariationTexture_TexelSize;
			float4 _WaterfallStartNoise_ST;
			float4 _Color4;
			float4 _CloudNoise_ST;
			float4 _NoiseLines_ST;
			float4 _WaterfallEdge_ST;
			float4 _Color3;
			float4 _ColorVariationTexture_ST;
			float4 _Color1;
			float2 _StartNoiseHarshTiling;
			float2 _SmallDots2Scale;
			float2 _SmallDots1Scale;
			float _NormalStrength;
			float _SmallDots1Distortion;
			float _SmallDots1Opacity;
			float _StartNoiseHarshStep;
			float _Smoothness;
			float _StartNoiseHarshSpeed;
			float _StartNoiseHarshDistortion;
			float _StartNoiseharshTopPosition;
			float _StartNoiseharshTopBlend;
			float _StartNoiseharshBottomPosition;
			float _StartNoiseharshBottomBlend;
			float _SmallDots2Step;
			float _DebugCloudNoise;
			float _SmallDots1Speed;
			float _SmallDots2Distortion;
			float _SmallDots2Opacity;
			float _EdgeFoamStep;
			float _DebugNormals;
			float _EdgeFoamDistance;
			float _EdgeFoamOpacity;
			float _DebugWaterColor;
			float _SmallDots2Speed;
			float _ColorVariationContrast;
			float _WaterfallEdgeFoamOpacity;
			float _NoiseLinesSpeed;
			float _ColorVariationDepth;
			float _CloudNoiseSpeed;
			float _NoiseLinesDistortion;
			float _NoiseLinesOpacity;
			float _NoiseLinesReveal;
			float _NoiseLinesPow;
			float _ColorVariationSpeed;
			float _WaterfallStartNoiseSpeed;
			float _WaterfallStartNoiseDistortion;
			float _WaterfallStartNoiseDepth;
			float _WaterfallStartNoiseExtend;
			float _WaterfallStartNoisePow;
			float _WaterfallStartNoisePosition;
			float _WaterfallStartNoiseOpacity;
			float _BottomFoamStep;
			float _BottomFoamSpeed;
			float _BottomFoamDistortion;
			float _BottomFoamExtendMax;
			float _BottomFoamExtendMin;
			float _BottomFoamWidthPow;
			float _InitialOpacityGradience;
			float _WaterfallEdgeSpeed;
			float _SmallDots1Step;
			float _BottomOpacityCutout;
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

			sampler2D _WaterfallEdge;


			
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

				float2 uv_WaterfallEdge = input.ase_texcoord3.xy * _WaterfallEdge_ST.xy + _WaterfallEdge_ST.zw;
				float mulTime79 = _TimeParameters.x * -_WaterfallEdgeSpeed;
				float2 appendResult81 = (float2(0.0 , mulTime79));
				float4 tex2DNode83 = tex2D( _WaterfallEdge, ( uv_WaterfallEdge + appendResult81 ) );
				float Opacity93 = step( 0.1 , tex2DNode83.r );
				float2 texCoord317 = input.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DEBUG_ON
				float staticSwitch360 = 1.0;
				#else
				float staticSwitch360 = ( Opacity93 * saturate( ( texCoord317.y * _InitialOpacityGradience ) ) * ( 1.0 - step( _BottomOpacityCutout , texCoord317.y ) ) );
				#endif
				

				float Alpha = staticSwitch360;
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
			float4 _Color2;
			float4 _ColorVariationTexture_TexelSize;
			float4 _WaterfallStartNoise_ST;
			float4 _Color4;
			float4 _CloudNoise_ST;
			float4 _NoiseLines_ST;
			float4 _WaterfallEdge_ST;
			float4 _Color3;
			float4 _ColorVariationTexture_ST;
			float4 _Color1;
			float2 _StartNoiseHarshTiling;
			float2 _SmallDots2Scale;
			float2 _SmallDots1Scale;
			float _NormalStrength;
			float _SmallDots1Distortion;
			float _SmallDots1Opacity;
			float _StartNoiseHarshStep;
			float _Smoothness;
			float _StartNoiseHarshSpeed;
			float _StartNoiseHarshDistortion;
			float _StartNoiseharshTopPosition;
			float _StartNoiseharshTopBlend;
			float _StartNoiseharshBottomPosition;
			float _StartNoiseharshBottomBlend;
			float _SmallDots2Step;
			float _DebugCloudNoise;
			float _SmallDots1Speed;
			float _SmallDots2Distortion;
			float _SmallDots2Opacity;
			float _EdgeFoamStep;
			float _DebugNormals;
			float _EdgeFoamDistance;
			float _EdgeFoamOpacity;
			float _DebugWaterColor;
			float _SmallDots2Speed;
			float _ColorVariationContrast;
			float _WaterfallEdgeFoamOpacity;
			float _NoiseLinesSpeed;
			float _ColorVariationDepth;
			float _CloudNoiseSpeed;
			float _NoiseLinesDistortion;
			float _NoiseLinesOpacity;
			float _NoiseLinesReveal;
			float _NoiseLinesPow;
			float _ColorVariationSpeed;
			float _WaterfallStartNoiseSpeed;
			float _WaterfallStartNoiseDistortion;
			float _WaterfallStartNoiseDepth;
			float _WaterfallStartNoiseExtend;
			float _WaterfallStartNoisePow;
			float _WaterfallStartNoisePosition;
			float _WaterfallStartNoiseOpacity;
			float _BottomFoamStep;
			float _BottomFoamSpeed;
			float _BottomFoamDistortion;
			float _BottomFoamExtendMax;
			float _BottomFoamExtendMin;
			float _BottomFoamWidthPow;
			float _InitialOpacityGradience;
			float _WaterfallEdgeSpeed;
			float _SmallDots1Step;
			float _BottomOpacityCutout;
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

			sampler2D _WaterfallEdge;


			
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

				float2 uv_WaterfallEdge = input.ase_texcoord3.xy * _WaterfallEdge_ST.xy + _WaterfallEdge_ST.zw;
				float mulTime79 = _TimeParameters.x * -_WaterfallEdgeSpeed;
				float2 appendResult81 = (float2(0.0 , mulTime79));
				float4 tex2DNode83 = tex2D( _WaterfallEdge, ( uv_WaterfallEdge + appendResult81 ) );
				float Opacity93 = step( 0.1 , tex2DNode83.r );
				float2 texCoord317 = input.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DEBUG_ON
				float staticSwitch360 = 1.0;
				#else
				float staticSwitch360 = ( Opacity93 * saturate( ( texCoord317.y * _InitialOpacityGradience ) ) * ( 1.0 - step( _BottomOpacityCutout , texCoord317.y ) ) );
				#endif
				

				float Alpha = staticSwitch360;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color2;
			float4 _ColorVariationTexture_TexelSize;
			float4 _WaterfallStartNoise_ST;
			float4 _Color4;
			float4 _CloudNoise_ST;
			float4 _NoiseLines_ST;
			float4 _WaterfallEdge_ST;
			float4 _Color3;
			float4 _ColorVariationTexture_ST;
			float4 _Color1;
			float2 _StartNoiseHarshTiling;
			float2 _SmallDots2Scale;
			float2 _SmallDots1Scale;
			float _NormalStrength;
			float _SmallDots1Distortion;
			float _SmallDots1Opacity;
			float _StartNoiseHarshStep;
			float _Smoothness;
			float _StartNoiseHarshSpeed;
			float _StartNoiseHarshDistortion;
			float _StartNoiseharshTopPosition;
			float _StartNoiseharshTopBlend;
			float _StartNoiseharshBottomPosition;
			float _StartNoiseharshBottomBlend;
			float _SmallDots2Step;
			float _DebugCloudNoise;
			float _SmallDots1Speed;
			float _SmallDots2Distortion;
			float _SmallDots2Opacity;
			float _EdgeFoamStep;
			float _DebugNormals;
			float _EdgeFoamDistance;
			float _EdgeFoamOpacity;
			float _DebugWaterColor;
			float _SmallDots2Speed;
			float _ColorVariationContrast;
			float _WaterfallEdgeFoamOpacity;
			float _NoiseLinesSpeed;
			float _ColorVariationDepth;
			float _CloudNoiseSpeed;
			float _NoiseLinesDistortion;
			float _NoiseLinesOpacity;
			float _NoiseLinesReveal;
			float _NoiseLinesPow;
			float _ColorVariationSpeed;
			float _WaterfallStartNoiseSpeed;
			float _WaterfallStartNoiseDistortion;
			float _WaterfallStartNoiseDepth;
			float _WaterfallStartNoiseExtend;
			float _WaterfallStartNoisePow;
			float _WaterfallStartNoisePosition;
			float _WaterfallStartNoiseOpacity;
			float _BottomFoamStep;
			float _BottomFoamSpeed;
			float _BottomFoamDistortion;
			float _BottomFoamExtendMax;
			float _BottomFoamExtendMin;
			float _BottomFoamWidthPow;
			float _InitialOpacityGradience;
			float _WaterfallEdgeSpeed;
			float _SmallDots1Step;
			float _BottomOpacityCutout;
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

			sampler2D _ColorVariationTexture;
			sampler2D _NoiseLines;
			sampler2D _CloudNoise;
			sampler2D _WaterfallStartNoise;
			sampler2D _WaterfallEdge;
			sampler2D _TopVoronoi;


			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			
			void CalculateUVsSmooth46_g2( float2 UV, float4 TexelSize, out float2 UV0, out float2 UV1, out float2 UV2, out float2 UV3, out float2 UV4, out float2 UV5, out float2 UV6, out float2 UV7, out float2 UV8 )
			{
				{
				    float3 pos = float3( TexelSize.xy, 0 );
				    float3 neg = float3( -pos.xy, 0 );
				    UV0 = UV + neg.xy;
				    UV1 = UV + neg.zy;
				    UV2 = UV + float2( pos.x, neg.y );
				    UV3 = UV + neg.xz;
				    UV4 = UV;
				    UV5 = UV + pos.xz;
				    UV6 = UV + float2( neg.x, pos.y );
				    UV7 = UV + pos.zy;
				    UV8 = UV + pos.xy;
				    return;
				}
			}
			
			float3 CombineSamplesSmooth58_g2( float Strength, float S0, float S1, float S2, float S3, float S4, float S5, float S6, float S7, float S8 )
			{
				{
				    float3 normal;
				    normal.x = Strength * ( S0 - S2 + 2 * S3 - 2 * S5 + S6 - S8 );
				    normal.y = Strength * ( S0 + 2 * S1 + S2 - S6 - 2 * S7 - S8 );
				    normal.z = 1.0;
				    return normalize( normal );
				}
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				float3 ase_tangentWS = TransformObjectToWorldDir( input.ase_tangent.xyz );
				output.ase_texcoord5.xyz = ase_tangentWS;
				float3 ase_normalWS = TransformObjectToWorldNormal( input.normalOS );
				output.ase_texcoord6.xyz = ase_normalWS;
				float ase_tangentSign = input.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_bitangentWS = cross( ase_normalWS, ase_tangentWS ) * ase_tangentSign;
				output.ase_texcoord7.xyz = ase_bitangentWS;
				float4 ase_positionCS = TransformObjectToHClip( ( input.positionOS ).xyz );
				float4 screenPos = ComputeScreenPos( ase_positionCS );
				output.ase_texcoord8 = screenPos;
				
				output.ase_texcoord4.xy = input.texcoord0.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord4.zw = 0;
				output.ase_texcoord5.w = 0;
				output.ase_texcoord6.w = 0;
				output.ase_texcoord7.w = 0;

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

				float2 uv_ColorVariationTexture = input.ase_texcoord4.xy * _ColorVariationTexture_ST.xy + _ColorVariationTexture_ST.zw;
				float mulTime52 = _TimeParameters.x * _ColorVariationSpeed;
				float2 appendResult54 = (float2(0.0 , mulTime52));
				float2 temp_output_55_0 = ( uv_ColorVariationTexture + appendResult54 );
				float4 tex2DNode48 = tex2D( _ColorVariationTexture, temp_output_55_0 );
				float3 ase_tangentWS = input.ase_texcoord5.xyz;
				float3 ase_normalWS = input.ase_texcoord6.xyz;
				float3 ase_bitangentWS = input.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_tangentWS.x, ase_bitangentWS.x, ase_normalWS.x );
				float3 tanToWorld1 = float3( ase_tangentWS.y, ase_bitangentWS.y, ase_normalWS.y );
				float3 tanToWorld2 = float3( ase_tangentWS.z, ase_bitangentWS.z, ase_normalWS.z );
				float3 ase_viewVectorTS =  tanToWorld0 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).x + tanToWorld1 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).y  + tanToWorld2 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).z;
				float3 normalizeResult59 = normalize( ase_viewVectorTS );
				float2 paralaxOffset47 = ParallaxOffset( tex2DNode48.g , _ColorVariationDepth , normalizeResult59 );
				float4 tex2DNode57 = tex2D( _ColorVariationTexture, ( paralaxOffset47 + temp_output_55_0 ) );
				float4 lerpResult62 = lerp( _Color2 , _Color1 , pow( tex2DNode57.g , _ColorVariationContrast ));
				float2 uv_NoiseLines = input.ase_texcoord4.xy * _NoiseLines_ST.xy + _NoiseLines_ST.zw;
				float mulTime188 = _TimeParameters.x * _NoiseLinesSpeed;
				float2 appendResult190 = (float2(0.0 , mulTime188));
				float2 uv_CloudNoise = input.ase_texcoord4.xy * _CloudNoise_ST.xy + _CloudNoise_ST.zw;
				float mulTime32 = _TimeParameters.x * _CloudNoiseSpeed;
				float2 appendResult33 = (float2(mulTime32 , 0.0));
				float4 Cloud_Noise37 = tex2D( _CloudNoise, ( uv_CloudNoise + appendResult33 ) );
				float4 lerpResult199 = lerp( lerpResult62 , _Color3 , pow( saturate( ( tex2D( _NoiseLines, ( uv_NoiseLines + appendResult190 + ( (Cloud_Noise37).rg * _NoiseLinesDistortion ) ) ).g * _NoiseLinesOpacity * pow( tex2DNode48.g , _NoiseLinesReveal ) ) ) , _NoiseLinesPow ));
				float2 uv_WaterfallStartNoise = input.ase_texcoord4.xy * _WaterfallStartNoise_ST.xy + _WaterfallStartNoise_ST.zw;
				float mulTime3 = _TimeParameters.x * _WaterfallStartNoiseSpeed;
				float2 appendResult5 = (float2(0.0 , mulTime3));
				float2 temp_output_6_0 = ( uv_WaterfallStartNoise + appendResult5 + ( (Cloud_Noise37).rg * _WaterfallStartNoiseDistortion ) );
				float3 normalizeResult236 = normalize( ase_viewVectorTS );
				float2 paralaxOffset234 = ParallaxOffset( tex2D( _WaterfallStartNoise, temp_output_6_0 ).g , _WaterfallStartNoiseDepth , normalizeResult236 );
				float2 texCoord17 = input.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult19 = smoothstep( _WaterfallStartNoiseExtend , _WaterfallStartNoisePow , abs( ( texCoord17.y - _WaterfallStartNoisePosition ) ));
				float4 lerpResult238 = lerp( lerpResult199 , float4( _Color4.rgb , 0.0 ) , saturate( ( tex2D( _WaterfallStartNoise, ( temp_output_6_0 + paralaxOffset234 ) ).g * ( smoothstepResult19 * _WaterfallStartNoiseOpacity ) ) ));
				float4 Water_Color73 = lerpResult238;
				float mulTime252 = _TimeParameters.x * _BottomFoamSpeed;
				float2 appendResult254 = (float2(0.0 , mulTime252));
				float2 texCoord257 = input.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult258 = smoothstep( _BottomFoamExtendMax , _BottomFoamExtendMin , ( 1.0 - texCoord257.y ));
				float Bottom_Foam264 = step( _BottomFoamStep , ( tex2D( _WaterfallStartNoise, ( uv_WaterfallStartNoise + appendResult254 + ( (Cloud_Noise37).rg * _BottomFoamDistortion ) ) ).g * smoothstepResult258 * pow( ( 1.0 - ( abs( ( texCoord257.x - 0.5 ) ) * 2.0 ) ) , _BottomFoamWidthPow ) ) );
				float2 uv_WaterfallEdge = input.ase_texcoord4.xy * _WaterfallEdge_ST.xy + _WaterfallEdge_ST.zw;
				float mulTime79 = _TimeParameters.x * -_WaterfallEdgeSpeed;
				float2 appendResult81 = (float2(0.0 , mulTime79));
				float4 tex2DNode83 = tex2D( _WaterfallEdge, ( uv_WaterfallEdge + appendResult81 ) );
				float Watefal_Edge87 = ( step( 0.6 , tex2DNode83.r ) * _WaterfallEdgeFoamOpacity );
				float2 texCoord129 = input.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime133 = _TimeParameters.x * _SmallDots1Speed;
				float2 appendResult134 = (float2(0.0 , mulTime133));
				float Small_Dots_1139 = ( step( _SmallDots1Step , tex2D( _TopVoronoi, ( ( texCoord129 * _SmallDots1Scale ) + appendResult134 + ( ( (Cloud_Noise37).rg - float2( 0.5,0.5 ) ) * _SmallDots1Distortion ) + float2( 0.32,0.27 ) ) ).g ) * _SmallDots1Opacity );
				float2 texCoord290 = input.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime295 = _TimeParameters.x * _StartNoiseHarshSpeed;
				float2 appendResult296 = (float2(0.0 , mulTime295));
				float smoothstepResult303 = smoothstep( _StartNoiseharshTopPosition , ( _StartNoiseharshTopPosition + _StartNoiseharshTopBlend ) , texCoord290.y);
				float smoothstepResult304 = smoothstep( _StartNoiseharshBottomPosition , ( _StartNoiseharshBottomPosition + _StartNoiseharshBottomBlend ) , texCoord290.y);
				float Start_Noise_Harsh316 = step( _StartNoiseHarshStep , ( tex2D( _WaterfallStartNoise, ( ( texCoord290 * _StartNoiseHarshTiling ) + appendResult296 + ( (Cloud_Noise37).rg * _StartNoiseHarshDistortion ) ) ).g * ( smoothstepResult303 * ( 1.0 - smoothstepResult304 ) ) ) );
				float2 texCoord154 = input.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime156 = _TimeParameters.x * _SmallDots2Speed;
				float2 appendResult161 = (float2(0.0 , mulTime156));
				float Small_Dots_2168 = ( step( _SmallDots2Step , tex2D( _TopVoronoi, ( ( texCoord154 * _SmallDots2Scale ) + appendResult161 + ( ( (Cloud_Noise37).rg - float2( 0.5,0.5 ) ) * _SmallDots2Distortion ) ) ).g ) * _SmallDots2Opacity );
				float4 screenPos = input.ase_texcoord8;
				float4 ase_positionSSNorm = screenPos / screenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float depthLinearEye370 = LinearEyeDepth( SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_positionSSNorm.xy ), _ZBufferParams );
				float Scene_Depth372 = ( depthLinearEye370 - screenPos.w );
				float Edge_Foam382 = ( step( _EdgeFoamStep , saturate( ( saturate( ( ( ( Scene_Depth372 - _EdgeFoamDistance ) / _EdgeFoamDistance ) * -1.0 ) ) * tex2DNode57.g ) ) ) * _EdgeFoamOpacity );
				float Foam_Mask71 = max( max( max( Bottom_Foam264 , Watefal_Edge87 ) , Small_Dots_1139 ) , max( max( Start_Noise_Harsh316 , Small_Dots_2168 ) , Edge_Foam382 ) );
				float4 lerpResult67 = lerp( Water_Color73 , float4( 1,1,1,0 ) , Foam_Mask71);
				float4 temp_cast_1 = (0.0).xxxx;
				#ifdef _DEBUG_ON
				float4 staticSwitch358 = temp_cast_1;
				#else
				float4 staticSwitch358 = lerpResult67;
				#endif
				
				float4 temp_cast_3 = (0.0).xxxx;
				float temp_output_91_0_g2 = _NormalStrength;
				float Strength58_g2 = temp_output_91_0_g2;
				float localCalculateUVsSmooth46_g2 = ( 0.0 );
				float2 temp_output_85_0_g2 = temp_output_55_0;
				float2 UV46_g2 = temp_output_85_0_g2;
				float4 TexelSize46_g2 = _ColorVariationTexture_TexelSize;
				float2 UV046_g2 = float2( 0,0 );
				float2 UV146_g2 = float2( 0,0 );
				float2 UV246_g2 = float2( 0,0 );
				float2 UV346_g2 = float2( 0,0 );
				float2 UV446_g2 = float2( 0,0 );
				float2 UV546_g2 = float2( 0,0 );
				float2 UV646_g2 = float2( 0,0 );
				float2 UV746_g2 = float2( 0,0 );
				float2 UV846_g2 = float2( 0,0 );
				CalculateUVsSmooth46_g2( UV46_g2 , TexelSize46_g2 , UV046_g2 , UV146_g2 , UV246_g2 , UV346_g2 , UV446_g2 , UV546_g2 , UV646_g2 , UV746_g2 , UV846_g2 );
				float4 break140_g2 = tex2D( _ColorVariationTexture, UV046_g2 );
				float S058_g2 = break140_g2.g;
				float4 break142_g2 = tex2D( _ColorVariationTexture, UV146_g2 );
				float S158_g2 = break142_g2.g;
				float4 break146_g2 = tex2D( _ColorVariationTexture, UV246_g2 );
				float S258_g2 = break146_g2.g;
				float4 break148_g2 = tex2D( _ColorVariationTexture, UV346_g2 );
				float S358_g2 = break148_g2.g;
				float4 break150_g2 = tex2D( _ColorVariationTexture, UV446_g2 );
				float S458_g2 = break150_g2.g;
				float4 break152_g2 = tex2D( _ColorVariationTexture, UV546_g2 );
				float S558_g2 = break152_g2.g;
				float4 break154_g2 = tex2D( _ColorVariationTexture, UV646_g2 );
				float S658_g2 = break154_g2.g;
				float4 break156_g2 = tex2D( _ColorVariationTexture, UV746_g2 );
				float S758_g2 = break156_g2.g;
				float4 break158_g2 = tex2D( _ColorVariationTexture, UV846_g2 );
				float S858_g2 = break158_g2.g;
				float3 localCombineSamplesSmooth58_g2 = CombineSamplesSmooth58_g2( Strength58_g2 , S058_g2 , S158_g2 , S258_g2 , S358_g2 , S458_g2 , S558_g2 , S658_g2 , S758_g2 , S858_g2 );
				float3 Normals366 = localCombineSamplesSmooth58_g2;
				#ifdef _DEBUG_ON
				float4 staticSwitch357 = ( ( Water_Color73 * _DebugWaterColor ) + float4( ( Normals366 * _DebugNormals ) , 0.0 ) + ( Cloud_Noise37 * _DebugCloudNoise ) );
				#else
				float4 staticSwitch357 = temp_cast_3;
				#endif
				
				float Opacity93 = step( 0.1 , tex2DNode83.r );
				float2 texCoord317 = input.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DEBUG_ON
				float staticSwitch360 = 1.0;
				#else
				float staticSwitch360 = ( Opacity93 * saturate( ( texCoord317.y * _InitialOpacityGradience ) ) * ( 1.0 - step( _BottomOpacityCutout , texCoord317.y ) ) );
				#endif
				

				float3 BaseColor = staticSwitch358.rgb;
				float3 Emission = staticSwitch357.rgb;
				float Alpha = staticSwitch360;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color2;
			float4 _ColorVariationTexture_TexelSize;
			float4 _WaterfallStartNoise_ST;
			float4 _Color4;
			float4 _CloudNoise_ST;
			float4 _NoiseLines_ST;
			float4 _WaterfallEdge_ST;
			float4 _Color3;
			float4 _ColorVariationTexture_ST;
			float4 _Color1;
			float2 _StartNoiseHarshTiling;
			float2 _SmallDots2Scale;
			float2 _SmallDots1Scale;
			float _NormalStrength;
			float _SmallDots1Distortion;
			float _SmallDots1Opacity;
			float _StartNoiseHarshStep;
			float _Smoothness;
			float _StartNoiseHarshSpeed;
			float _StartNoiseHarshDistortion;
			float _StartNoiseharshTopPosition;
			float _StartNoiseharshTopBlend;
			float _StartNoiseharshBottomPosition;
			float _StartNoiseharshBottomBlend;
			float _SmallDots2Step;
			float _DebugCloudNoise;
			float _SmallDots1Speed;
			float _SmallDots2Distortion;
			float _SmallDots2Opacity;
			float _EdgeFoamStep;
			float _DebugNormals;
			float _EdgeFoamDistance;
			float _EdgeFoamOpacity;
			float _DebugWaterColor;
			float _SmallDots2Speed;
			float _ColorVariationContrast;
			float _WaterfallEdgeFoamOpacity;
			float _NoiseLinesSpeed;
			float _ColorVariationDepth;
			float _CloudNoiseSpeed;
			float _NoiseLinesDistortion;
			float _NoiseLinesOpacity;
			float _NoiseLinesReveal;
			float _NoiseLinesPow;
			float _ColorVariationSpeed;
			float _WaterfallStartNoiseSpeed;
			float _WaterfallStartNoiseDistortion;
			float _WaterfallStartNoiseDepth;
			float _WaterfallStartNoiseExtend;
			float _WaterfallStartNoisePow;
			float _WaterfallStartNoisePosition;
			float _WaterfallStartNoiseOpacity;
			float _BottomFoamStep;
			float _BottomFoamSpeed;
			float _BottomFoamDistortion;
			float _BottomFoamExtendMax;
			float _BottomFoamExtendMin;
			float _BottomFoamWidthPow;
			float _InitialOpacityGradience;
			float _WaterfallEdgeSpeed;
			float _SmallDots1Step;
			float _BottomOpacityCutout;
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

			sampler2D _ColorVariationTexture;
			sampler2D _NoiseLines;
			sampler2D _CloudNoise;
			sampler2D _WaterfallStartNoise;
			sampler2D _WaterfallEdge;
			sampler2D _TopVoronoi;


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

				float3 ase_tangentWS = TransformObjectToWorldDir( input.ase_tangent.xyz );
				output.ase_texcoord3.xyz = ase_tangentWS;
				float3 ase_normalWS = TransformObjectToWorldNormal( input.normalOS );
				output.ase_texcoord4.xyz = ase_normalWS;
				float ase_tangentSign = input.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_bitangentWS = cross( ase_normalWS, ase_tangentWS ) * ase_tangentSign;
				output.ase_texcoord5.xyz = ase_bitangentWS;
				float4 ase_positionCS = TransformObjectToHClip( ( input.positionOS ).xyz );
				float4 screenPos = ComputeScreenPos( ase_positionCS );
				output.ase_texcoord6 = screenPos;
				
				output.ase_texcoord2.xy = input.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				output.ase_texcoord2.zw = 0;
				output.ase_texcoord3.w = 0;
				output.ase_texcoord4.w = 0;
				output.ase_texcoord5.w = 0;

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

				float2 uv_ColorVariationTexture = input.ase_texcoord2.xy * _ColorVariationTexture_ST.xy + _ColorVariationTexture_ST.zw;
				float mulTime52 = _TimeParameters.x * _ColorVariationSpeed;
				float2 appendResult54 = (float2(0.0 , mulTime52));
				float2 temp_output_55_0 = ( uv_ColorVariationTexture + appendResult54 );
				float4 tex2DNode48 = tex2D( _ColorVariationTexture, temp_output_55_0 );
				float3 ase_tangentWS = input.ase_texcoord3.xyz;
				float3 ase_normalWS = input.ase_texcoord4.xyz;
				float3 ase_bitangentWS = input.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_tangentWS.x, ase_bitangentWS.x, ase_normalWS.x );
				float3 tanToWorld1 = float3( ase_tangentWS.y, ase_bitangentWS.y, ase_normalWS.y );
				float3 tanToWorld2 = float3( ase_tangentWS.z, ase_bitangentWS.z, ase_normalWS.z );
				float3 ase_viewVectorTS =  tanToWorld0 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).x + tanToWorld1 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).y  + tanToWorld2 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).z;
				float3 normalizeResult59 = normalize( ase_viewVectorTS );
				float2 paralaxOffset47 = ParallaxOffset( tex2DNode48.g , _ColorVariationDepth , normalizeResult59 );
				float4 tex2DNode57 = tex2D( _ColorVariationTexture, ( paralaxOffset47 + temp_output_55_0 ) );
				float4 lerpResult62 = lerp( _Color2 , _Color1 , pow( tex2DNode57.g , _ColorVariationContrast ));
				float2 uv_NoiseLines = input.ase_texcoord2.xy * _NoiseLines_ST.xy + _NoiseLines_ST.zw;
				float mulTime188 = _TimeParameters.x * _NoiseLinesSpeed;
				float2 appendResult190 = (float2(0.0 , mulTime188));
				float2 uv_CloudNoise = input.ase_texcoord2.xy * _CloudNoise_ST.xy + _CloudNoise_ST.zw;
				float mulTime32 = _TimeParameters.x * _CloudNoiseSpeed;
				float2 appendResult33 = (float2(mulTime32 , 0.0));
				float4 Cloud_Noise37 = tex2D( _CloudNoise, ( uv_CloudNoise + appendResult33 ) );
				float4 lerpResult199 = lerp( lerpResult62 , _Color3 , pow( saturate( ( tex2D( _NoiseLines, ( uv_NoiseLines + appendResult190 + ( (Cloud_Noise37).rg * _NoiseLinesDistortion ) ) ).g * _NoiseLinesOpacity * pow( tex2DNode48.g , _NoiseLinesReveal ) ) ) , _NoiseLinesPow ));
				float2 uv_WaterfallStartNoise = input.ase_texcoord2.xy * _WaterfallStartNoise_ST.xy + _WaterfallStartNoise_ST.zw;
				float mulTime3 = _TimeParameters.x * _WaterfallStartNoiseSpeed;
				float2 appendResult5 = (float2(0.0 , mulTime3));
				float2 temp_output_6_0 = ( uv_WaterfallStartNoise + appendResult5 + ( (Cloud_Noise37).rg * _WaterfallStartNoiseDistortion ) );
				float3 normalizeResult236 = normalize( ase_viewVectorTS );
				float2 paralaxOffset234 = ParallaxOffset( tex2D( _WaterfallStartNoise, temp_output_6_0 ).g , _WaterfallStartNoiseDepth , normalizeResult236 );
				float2 texCoord17 = input.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult19 = smoothstep( _WaterfallStartNoiseExtend , _WaterfallStartNoisePow , abs( ( texCoord17.y - _WaterfallStartNoisePosition ) ));
				float4 lerpResult238 = lerp( lerpResult199 , float4( _Color4.rgb , 0.0 ) , saturate( ( tex2D( _WaterfallStartNoise, ( temp_output_6_0 + paralaxOffset234 ) ).g * ( smoothstepResult19 * _WaterfallStartNoiseOpacity ) ) ));
				float4 Water_Color73 = lerpResult238;
				float mulTime252 = _TimeParameters.x * _BottomFoamSpeed;
				float2 appendResult254 = (float2(0.0 , mulTime252));
				float2 texCoord257 = input.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult258 = smoothstep( _BottomFoamExtendMax , _BottomFoamExtendMin , ( 1.0 - texCoord257.y ));
				float Bottom_Foam264 = step( _BottomFoamStep , ( tex2D( _WaterfallStartNoise, ( uv_WaterfallStartNoise + appendResult254 + ( (Cloud_Noise37).rg * _BottomFoamDistortion ) ) ).g * smoothstepResult258 * pow( ( 1.0 - ( abs( ( texCoord257.x - 0.5 ) ) * 2.0 ) ) , _BottomFoamWidthPow ) ) );
				float2 uv_WaterfallEdge = input.ase_texcoord2.xy * _WaterfallEdge_ST.xy + _WaterfallEdge_ST.zw;
				float mulTime79 = _TimeParameters.x * -_WaterfallEdgeSpeed;
				float2 appendResult81 = (float2(0.0 , mulTime79));
				float4 tex2DNode83 = tex2D( _WaterfallEdge, ( uv_WaterfallEdge + appendResult81 ) );
				float Watefal_Edge87 = ( step( 0.6 , tex2DNode83.r ) * _WaterfallEdgeFoamOpacity );
				float2 texCoord129 = input.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime133 = _TimeParameters.x * _SmallDots1Speed;
				float2 appendResult134 = (float2(0.0 , mulTime133));
				float Small_Dots_1139 = ( step( _SmallDots1Step , tex2D( _TopVoronoi, ( ( texCoord129 * _SmallDots1Scale ) + appendResult134 + ( ( (Cloud_Noise37).rg - float2( 0.5,0.5 ) ) * _SmallDots1Distortion ) + float2( 0.32,0.27 ) ) ).g ) * _SmallDots1Opacity );
				float2 texCoord290 = input.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime295 = _TimeParameters.x * _StartNoiseHarshSpeed;
				float2 appendResult296 = (float2(0.0 , mulTime295));
				float smoothstepResult303 = smoothstep( _StartNoiseharshTopPosition , ( _StartNoiseharshTopPosition + _StartNoiseharshTopBlend ) , texCoord290.y);
				float smoothstepResult304 = smoothstep( _StartNoiseharshBottomPosition , ( _StartNoiseharshBottomPosition + _StartNoiseharshBottomBlend ) , texCoord290.y);
				float Start_Noise_Harsh316 = step( _StartNoiseHarshStep , ( tex2D( _WaterfallStartNoise, ( ( texCoord290 * _StartNoiseHarshTiling ) + appendResult296 + ( (Cloud_Noise37).rg * _StartNoiseHarshDistortion ) ) ).g * ( smoothstepResult303 * ( 1.0 - smoothstepResult304 ) ) ) );
				float2 texCoord154 = input.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime156 = _TimeParameters.x * _SmallDots2Speed;
				float2 appendResult161 = (float2(0.0 , mulTime156));
				float Small_Dots_2168 = ( step( _SmallDots2Step , tex2D( _TopVoronoi, ( ( texCoord154 * _SmallDots2Scale ) + appendResult161 + ( ( (Cloud_Noise37).rg - float2( 0.5,0.5 ) ) * _SmallDots2Distortion ) ) ).g ) * _SmallDots2Opacity );
				float4 screenPos = input.ase_texcoord6;
				float4 ase_positionSSNorm = screenPos / screenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float depthLinearEye370 = LinearEyeDepth( SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_positionSSNorm.xy ), _ZBufferParams );
				float Scene_Depth372 = ( depthLinearEye370 - screenPos.w );
				float Edge_Foam382 = ( step( _EdgeFoamStep , saturate( ( saturate( ( ( ( Scene_Depth372 - _EdgeFoamDistance ) / _EdgeFoamDistance ) * -1.0 ) ) * tex2DNode57.g ) ) ) * _EdgeFoamOpacity );
				float Foam_Mask71 = max( max( max( Bottom_Foam264 , Watefal_Edge87 ) , Small_Dots_1139 ) , max( max( Start_Noise_Harsh316 , Small_Dots_2168 ) , Edge_Foam382 ) );
				float4 lerpResult67 = lerp( Water_Color73 , float4( 1,1,1,0 ) , Foam_Mask71);
				float4 temp_cast_1 = (0.0).xxxx;
				#ifdef _DEBUG_ON
				float4 staticSwitch358 = temp_cast_1;
				#else
				float4 staticSwitch358 = lerpResult67;
				#endif
				
				float Opacity93 = step( 0.1 , tex2DNode83.r );
				float2 texCoord317 = input.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DEBUG_ON
				float staticSwitch360 = 1.0;
				#else
				float staticSwitch360 = ( Opacity93 * saturate( ( texCoord317.y * _InitialOpacityGradience ) ) * ( 1.0 - step( _BottomOpacityCutout , texCoord317.y ) ) );
				#endif
				

				float3 BaseColor = staticSwitch358.rgb;
				float Alpha = staticSwitch360;
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
			Tags { "LightMode"="DepthNormals" }

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
			float4 _Color2;
			float4 _ColorVariationTexture_TexelSize;
			float4 _WaterfallStartNoise_ST;
			float4 _Color4;
			float4 _CloudNoise_ST;
			float4 _NoiseLines_ST;
			float4 _WaterfallEdge_ST;
			float4 _Color3;
			float4 _ColorVariationTexture_ST;
			float4 _Color1;
			float2 _StartNoiseHarshTiling;
			float2 _SmallDots2Scale;
			float2 _SmallDots1Scale;
			float _NormalStrength;
			float _SmallDots1Distortion;
			float _SmallDots1Opacity;
			float _StartNoiseHarshStep;
			float _Smoothness;
			float _StartNoiseHarshSpeed;
			float _StartNoiseHarshDistortion;
			float _StartNoiseharshTopPosition;
			float _StartNoiseharshTopBlend;
			float _StartNoiseharshBottomPosition;
			float _StartNoiseharshBottomBlend;
			float _SmallDots2Step;
			float _DebugCloudNoise;
			float _SmallDots1Speed;
			float _SmallDots2Distortion;
			float _SmallDots2Opacity;
			float _EdgeFoamStep;
			float _DebugNormals;
			float _EdgeFoamDistance;
			float _EdgeFoamOpacity;
			float _DebugWaterColor;
			float _SmallDots2Speed;
			float _ColorVariationContrast;
			float _WaterfallEdgeFoamOpacity;
			float _NoiseLinesSpeed;
			float _ColorVariationDepth;
			float _CloudNoiseSpeed;
			float _NoiseLinesDistortion;
			float _NoiseLinesOpacity;
			float _NoiseLinesReveal;
			float _NoiseLinesPow;
			float _ColorVariationSpeed;
			float _WaterfallStartNoiseSpeed;
			float _WaterfallStartNoiseDistortion;
			float _WaterfallStartNoiseDepth;
			float _WaterfallStartNoiseExtend;
			float _WaterfallStartNoisePow;
			float _WaterfallStartNoisePosition;
			float _WaterfallStartNoiseOpacity;
			float _BottomFoamStep;
			float _BottomFoamSpeed;
			float _BottomFoamDistortion;
			float _BottomFoamExtendMax;
			float _BottomFoamExtendMin;
			float _BottomFoamWidthPow;
			float _InitialOpacityGradience;
			float _WaterfallEdgeSpeed;
			float _SmallDots1Step;
			float _BottomOpacityCutout;
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

			sampler2D _ColorVariationTexture;
			sampler2D _WaterfallEdge;


			void CalculateUVsSmooth46_g2( float2 UV, float4 TexelSize, out float2 UV0, out float2 UV1, out float2 UV2, out float2 UV3, out float2 UV4, out float2 UV5, out float2 UV6, out float2 UV7, out float2 UV8 )
			{
				{
				    float3 pos = float3( TexelSize.xy, 0 );
				    float3 neg = float3( -pos.xy, 0 );
				    UV0 = UV + neg.xy;
				    UV1 = UV + neg.zy;
				    UV2 = UV + float2( pos.x, neg.y );
				    UV3 = UV + neg.xz;
				    UV4 = UV;
				    UV5 = UV + pos.xz;
				    UV6 = UV + float2( neg.x, pos.y );
				    UV7 = UV + pos.zy;
				    UV8 = UV + pos.xy;
				    return;
				}
			}
			
			float3 CombineSamplesSmooth58_g2( float Strength, float S0, float S1, float S2, float S3, float S4, float S5, float S6, float S7, float S8 )
			{
				{
				    float3 normal;
				    normal.x = Strength * ( S0 - S2 + 2 * S3 - 2 * S5 + S6 - S8 );
				    normal.y = Strength * ( S0 + 2 * S1 + S2 - S6 - 2 * S7 - S8 );
				    normal.z = 1.0;
				    return normalize( normal );
				}
			}
			

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

				float temp_output_91_0_g2 = _NormalStrength;
				float Strength58_g2 = temp_output_91_0_g2;
				float localCalculateUVsSmooth46_g2 = ( 0.0 );
				float2 uv_ColorVariationTexture = input.ase_texcoord5.xy * _ColorVariationTexture_ST.xy + _ColorVariationTexture_ST.zw;
				float mulTime52 = _TimeParameters.x * _ColorVariationSpeed;
				float2 appendResult54 = (float2(0.0 , mulTime52));
				float2 temp_output_55_0 = ( uv_ColorVariationTexture + appendResult54 );
				float2 temp_output_85_0_g2 = temp_output_55_0;
				float2 UV46_g2 = temp_output_85_0_g2;
				float4 TexelSize46_g2 = _ColorVariationTexture_TexelSize;
				float2 UV046_g2 = float2( 0,0 );
				float2 UV146_g2 = float2( 0,0 );
				float2 UV246_g2 = float2( 0,0 );
				float2 UV346_g2 = float2( 0,0 );
				float2 UV446_g2 = float2( 0,0 );
				float2 UV546_g2 = float2( 0,0 );
				float2 UV646_g2 = float2( 0,0 );
				float2 UV746_g2 = float2( 0,0 );
				float2 UV846_g2 = float2( 0,0 );
				CalculateUVsSmooth46_g2( UV46_g2 , TexelSize46_g2 , UV046_g2 , UV146_g2 , UV246_g2 , UV346_g2 , UV446_g2 , UV546_g2 , UV646_g2 , UV746_g2 , UV846_g2 );
				float4 break140_g2 = tex2D( _ColorVariationTexture, UV046_g2 );
				float S058_g2 = break140_g2.g;
				float4 break142_g2 = tex2D( _ColorVariationTexture, UV146_g2 );
				float S158_g2 = break142_g2.g;
				float4 break146_g2 = tex2D( _ColorVariationTexture, UV246_g2 );
				float S258_g2 = break146_g2.g;
				float4 break148_g2 = tex2D( _ColorVariationTexture, UV346_g2 );
				float S358_g2 = break148_g2.g;
				float4 break150_g2 = tex2D( _ColorVariationTexture, UV446_g2 );
				float S458_g2 = break150_g2.g;
				float4 break152_g2 = tex2D( _ColorVariationTexture, UV546_g2 );
				float S558_g2 = break152_g2.g;
				float4 break154_g2 = tex2D( _ColorVariationTexture, UV646_g2 );
				float S658_g2 = break154_g2.g;
				float4 break156_g2 = tex2D( _ColorVariationTexture, UV746_g2 );
				float S758_g2 = break156_g2.g;
				float4 break158_g2 = tex2D( _ColorVariationTexture, UV846_g2 );
				float S858_g2 = break158_g2.g;
				float3 localCombineSamplesSmooth58_g2 = CombineSamplesSmooth58_g2( Strength58_g2 , S058_g2 , S158_g2 , S258_g2 , S358_g2 , S458_g2 , S558_g2 , S658_g2 , S758_g2 , S858_g2 );
				float3 Normals366 = localCombineSamplesSmooth58_g2;
				#ifdef _DEBUG_ON
				float3 staticSwitch364 = float3(0,0,1);
				#else
				float3 staticSwitch364 = Normals366;
				#endif
				
				float2 uv_WaterfallEdge = input.ase_texcoord5.xy * _WaterfallEdge_ST.xy + _WaterfallEdge_ST.zw;
				float mulTime79 = _TimeParameters.x * -_WaterfallEdgeSpeed;
				float2 appendResult81 = (float2(0.0 , mulTime79));
				float4 tex2DNode83 = tex2D( _WaterfallEdge, ( uv_WaterfallEdge + appendResult81 ) );
				float Opacity93 = step( 0.1 , tex2DNode83.r );
				float2 texCoord317 = input.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DEBUG_ON
				float staticSwitch360 = 1.0;
				#else
				float staticSwitch360 = ( Opacity93 * saturate( ( texCoord317.y * _InitialOpacityGradience ) ) * ( 1.0 - step( _BottomOpacityCutout , texCoord317.y ) ) );
				#endif
				

				float3 Normal = staticSwitch364;
				float Alpha = staticSwitch360;
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

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
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
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color2;
			float4 _ColorVariationTexture_TexelSize;
			float4 _WaterfallStartNoise_ST;
			float4 _Color4;
			float4 _CloudNoise_ST;
			float4 _NoiseLines_ST;
			float4 _WaterfallEdge_ST;
			float4 _Color3;
			float4 _ColorVariationTexture_ST;
			float4 _Color1;
			float2 _StartNoiseHarshTiling;
			float2 _SmallDots2Scale;
			float2 _SmallDots1Scale;
			float _NormalStrength;
			float _SmallDots1Distortion;
			float _SmallDots1Opacity;
			float _StartNoiseHarshStep;
			float _Smoothness;
			float _StartNoiseHarshSpeed;
			float _StartNoiseHarshDistortion;
			float _StartNoiseharshTopPosition;
			float _StartNoiseharshTopBlend;
			float _StartNoiseharshBottomPosition;
			float _StartNoiseharshBottomBlend;
			float _SmallDots2Step;
			float _DebugCloudNoise;
			float _SmallDots1Speed;
			float _SmallDots2Distortion;
			float _SmallDots2Opacity;
			float _EdgeFoamStep;
			float _DebugNormals;
			float _EdgeFoamDistance;
			float _EdgeFoamOpacity;
			float _DebugWaterColor;
			float _SmallDots2Speed;
			float _ColorVariationContrast;
			float _WaterfallEdgeFoamOpacity;
			float _NoiseLinesSpeed;
			float _ColorVariationDepth;
			float _CloudNoiseSpeed;
			float _NoiseLinesDistortion;
			float _NoiseLinesOpacity;
			float _NoiseLinesReveal;
			float _NoiseLinesPow;
			float _ColorVariationSpeed;
			float _WaterfallStartNoiseSpeed;
			float _WaterfallStartNoiseDistortion;
			float _WaterfallStartNoiseDepth;
			float _WaterfallStartNoiseExtend;
			float _WaterfallStartNoisePow;
			float _WaterfallStartNoisePosition;
			float _WaterfallStartNoiseOpacity;
			float _BottomFoamStep;
			float _BottomFoamSpeed;
			float _BottomFoamDistortion;
			float _BottomFoamExtendMax;
			float _BottomFoamExtendMin;
			float _BottomFoamWidthPow;
			float _InitialOpacityGradience;
			float _WaterfallEdgeSpeed;
			float _SmallDots1Step;
			float _BottomOpacityCutout;
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

			sampler2D _ColorVariationTexture;
			sampler2D _NoiseLines;
			sampler2D _CloudNoise;
			sampler2D _WaterfallStartNoise;
			sampler2D _WaterfallEdge;
			sampler2D _TopVoronoi;


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			
			void CalculateUVsSmooth46_g2( float2 UV, float4 TexelSize, out float2 UV0, out float2 UV1, out float2 UV2, out float2 UV3, out float2 UV4, out float2 UV5, out float2 UV6, out float2 UV7, out float2 UV8 )
			{
				{
				    float3 pos = float3( TexelSize.xy, 0 );
				    float3 neg = float3( -pos.xy, 0 );
				    UV0 = UV + neg.xy;
				    UV1 = UV + neg.zy;
				    UV2 = UV + float2( pos.x, neg.y );
				    UV3 = UV + neg.xz;
				    UV4 = UV;
				    UV5 = UV + pos.xz;
				    UV6 = UV + float2( neg.x, pos.y );
				    UV7 = UV + pos.zy;
				    UV8 = UV + pos.xy;
				    return;
				}
			}
			
			float3 CombineSamplesSmooth58_g2( float Strength, float S0, float S1, float S2, float S3, float S4, float S5, float S6, float S7, float S8 )
			{
				{
				    float3 normal;
				    normal.x = Strength * ( S0 - S2 + 2 * S3 - 2 * S5 + S6 - S8 );
				    normal.y = Strength * ( S0 + 2 * S1 + S2 - S6 - 2 * S7 - S8 );
				    normal.z = 1.0;
				    return normalize( normal );
				}
			}
			

			PackedVaryings VertexFunction( Attributes input  )
			{
				PackedVaryings output = (PackedVaryings)0;
				UNITY_SETUP_INSTANCE_ID(input);
				UNITY_TRANSFER_INSTANCE_ID(input, output);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(output);

				output.ase_texcoord8.xy = input.texcoord.xy;
				
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

				float2 uv_ColorVariationTexture = input.ase_texcoord8.xy * _ColorVariationTexture_ST.xy + _ColorVariationTexture_ST.zw;
				float mulTime52 = _TimeParameters.x * _ColorVariationSpeed;
				float2 appendResult54 = (float2(0.0 , mulTime52));
				float2 temp_output_55_0 = ( uv_ColorVariationTexture + appendResult54 );
				float4 tex2DNode48 = tex2D( _ColorVariationTexture, temp_output_55_0 );
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 ase_viewVectorTS =  tanToWorld0 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).x + tanToWorld1 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).y  + tanToWorld2 * ( _WorldSpaceCameraPos.xyz - WorldPosition ).z;
				float3 normalizeResult59 = normalize( ase_viewVectorTS );
				float2 paralaxOffset47 = ParallaxOffset( tex2DNode48.g , _ColorVariationDepth , normalizeResult59 );
				float4 tex2DNode57 = tex2D( _ColorVariationTexture, ( paralaxOffset47 + temp_output_55_0 ) );
				float4 lerpResult62 = lerp( _Color2 , _Color1 , pow( tex2DNode57.g , _ColorVariationContrast ));
				float2 uv_NoiseLines = input.ase_texcoord8.xy * _NoiseLines_ST.xy + _NoiseLines_ST.zw;
				float mulTime188 = _TimeParameters.x * _NoiseLinesSpeed;
				float2 appendResult190 = (float2(0.0 , mulTime188));
				float2 uv_CloudNoise = input.ase_texcoord8.xy * _CloudNoise_ST.xy + _CloudNoise_ST.zw;
				float mulTime32 = _TimeParameters.x * _CloudNoiseSpeed;
				float2 appendResult33 = (float2(mulTime32 , 0.0));
				float4 Cloud_Noise37 = tex2D( _CloudNoise, ( uv_CloudNoise + appendResult33 ) );
				float4 lerpResult199 = lerp( lerpResult62 , _Color3 , pow( saturate( ( tex2D( _NoiseLines, ( uv_NoiseLines + appendResult190 + ( (Cloud_Noise37).rg * _NoiseLinesDistortion ) ) ).g * _NoiseLinesOpacity * pow( tex2DNode48.g , _NoiseLinesReveal ) ) ) , _NoiseLinesPow ));
				float2 uv_WaterfallStartNoise = input.ase_texcoord8.xy * _WaterfallStartNoise_ST.xy + _WaterfallStartNoise_ST.zw;
				float mulTime3 = _TimeParameters.x * _WaterfallStartNoiseSpeed;
				float2 appendResult5 = (float2(0.0 , mulTime3));
				float2 temp_output_6_0 = ( uv_WaterfallStartNoise + appendResult5 + ( (Cloud_Noise37).rg * _WaterfallStartNoiseDistortion ) );
				float3 normalizeResult236 = normalize( ase_viewVectorTS );
				float2 paralaxOffset234 = ParallaxOffset( tex2D( _WaterfallStartNoise, temp_output_6_0 ).g , _WaterfallStartNoiseDepth , normalizeResult236 );
				float2 texCoord17 = input.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult19 = smoothstep( _WaterfallStartNoiseExtend , _WaterfallStartNoisePow , abs( ( texCoord17.y - _WaterfallStartNoisePosition ) ));
				float4 lerpResult238 = lerp( lerpResult199 , float4( _Color4.rgb , 0.0 ) , saturate( ( tex2D( _WaterfallStartNoise, ( temp_output_6_0 + paralaxOffset234 ) ).g * ( smoothstepResult19 * _WaterfallStartNoiseOpacity ) ) ));
				float4 Water_Color73 = lerpResult238;
				float mulTime252 = _TimeParameters.x * _BottomFoamSpeed;
				float2 appendResult254 = (float2(0.0 , mulTime252));
				float2 texCoord257 = input.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float smoothstepResult258 = smoothstep( _BottomFoamExtendMax , _BottomFoamExtendMin , ( 1.0 - texCoord257.y ));
				float Bottom_Foam264 = step( _BottomFoamStep , ( tex2D( _WaterfallStartNoise, ( uv_WaterfallStartNoise + appendResult254 + ( (Cloud_Noise37).rg * _BottomFoamDistortion ) ) ).g * smoothstepResult258 * pow( ( 1.0 - ( abs( ( texCoord257.x - 0.5 ) ) * 2.0 ) ) , _BottomFoamWidthPow ) ) );
				float2 uv_WaterfallEdge = input.ase_texcoord8.xy * _WaterfallEdge_ST.xy + _WaterfallEdge_ST.zw;
				float mulTime79 = _TimeParameters.x * -_WaterfallEdgeSpeed;
				float2 appendResult81 = (float2(0.0 , mulTime79));
				float4 tex2DNode83 = tex2D( _WaterfallEdge, ( uv_WaterfallEdge + appendResult81 ) );
				float Watefal_Edge87 = ( step( 0.6 , tex2DNode83.r ) * _WaterfallEdgeFoamOpacity );
				float2 texCoord129 = input.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime133 = _TimeParameters.x * _SmallDots1Speed;
				float2 appendResult134 = (float2(0.0 , mulTime133));
				float Small_Dots_1139 = ( step( _SmallDots1Step , tex2D( _TopVoronoi, ( ( texCoord129 * _SmallDots1Scale ) + appendResult134 + ( ( (Cloud_Noise37).rg - float2( 0.5,0.5 ) ) * _SmallDots1Distortion ) + float2( 0.32,0.27 ) ) ).g ) * _SmallDots1Opacity );
				float2 texCoord290 = input.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime295 = _TimeParameters.x * _StartNoiseHarshSpeed;
				float2 appendResult296 = (float2(0.0 , mulTime295));
				float smoothstepResult303 = smoothstep( _StartNoiseharshTopPosition , ( _StartNoiseharshTopPosition + _StartNoiseharshTopBlend ) , texCoord290.y);
				float smoothstepResult304 = smoothstep( _StartNoiseharshBottomPosition , ( _StartNoiseharshBottomPosition + _StartNoiseharshBottomBlend ) , texCoord290.y);
				float Start_Noise_Harsh316 = step( _StartNoiseHarshStep , ( tex2D( _WaterfallStartNoise, ( ( texCoord290 * _StartNoiseHarshTiling ) + appendResult296 + ( (Cloud_Noise37).rg * _StartNoiseHarshDistortion ) ) ).g * ( smoothstepResult303 * ( 1.0 - smoothstepResult304 ) ) ) );
				float2 texCoord154 = input.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime156 = _TimeParameters.x * _SmallDots2Speed;
				float2 appendResult161 = (float2(0.0 , mulTime156));
				float Small_Dots_2168 = ( step( _SmallDots2Step , tex2D( _TopVoronoi, ( ( texCoord154 * _SmallDots2Scale ) + appendResult161 + ( ( (Cloud_Noise37).rg - float2( 0.5,0.5 ) ) * _SmallDots2Distortion ) ) ).g ) * _SmallDots2Opacity );
				float4 ase_positionSSNorm = ScreenPos / ScreenPos.w;
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float depthLinearEye370 = LinearEyeDepth( SHADERGRAPH_SAMPLE_SCENE_DEPTH( ase_positionSSNorm.xy ), _ZBufferParams );
				float Scene_Depth372 = ( depthLinearEye370 - ScreenPos.w );
				float Edge_Foam382 = ( step( _EdgeFoamStep , saturate( ( saturate( ( ( ( Scene_Depth372 - _EdgeFoamDistance ) / _EdgeFoamDistance ) * -1.0 ) ) * tex2DNode57.g ) ) ) * _EdgeFoamOpacity );
				float Foam_Mask71 = max( max( max( Bottom_Foam264 , Watefal_Edge87 ) , Small_Dots_1139 ) , max( max( Start_Noise_Harsh316 , Small_Dots_2168 ) , Edge_Foam382 ) );
				float4 lerpResult67 = lerp( Water_Color73 , float4( 1,1,1,0 ) , Foam_Mask71);
				float4 temp_cast_1 = (0.0).xxxx;
				#ifdef _DEBUG_ON
				float4 staticSwitch358 = temp_cast_1;
				#else
				float4 staticSwitch358 = lerpResult67;
				#endif
				
				float temp_output_91_0_g2 = _NormalStrength;
				float Strength58_g2 = temp_output_91_0_g2;
				float localCalculateUVsSmooth46_g2 = ( 0.0 );
				float2 temp_output_85_0_g2 = temp_output_55_0;
				float2 UV46_g2 = temp_output_85_0_g2;
				float4 TexelSize46_g2 = _ColorVariationTexture_TexelSize;
				float2 UV046_g2 = float2( 0,0 );
				float2 UV146_g2 = float2( 0,0 );
				float2 UV246_g2 = float2( 0,0 );
				float2 UV346_g2 = float2( 0,0 );
				float2 UV446_g2 = float2( 0,0 );
				float2 UV546_g2 = float2( 0,0 );
				float2 UV646_g2 = float2( 0,0 );
				float2 UV746_g2 = float2( 0,0 );
				float2 UV846_g2 = float2( 0,0 );
				CalculateUVsSmooth46_g2( UV46_g2 , TexelSize46_g2 , UV046_g2 , UV146_g2 , UV246_g2 , UV346_g2 , UV446_g2 , UV546_g2 , UV646_g2 , UV746_g2 , UV846_g2 );
				float4 break140_g2 = tex2D( _ColorVariationTexture, UV046_g2 );
				float S058_g2 = break140_g2.g;
				float4 break142_g2 = tex2D( _ColorVariationTexture, UV146_g2 );
				float S158_g2 = break142_g2.g;
				float4 break146_g2 = tex2D( _ColorVariationTexture, UV246_g2 );
				float S258_g2 = break146_g2.g;
				float4 break148_g2 = tex2D( _ColorVariationTexture, UV346_g2 );
				float S358_g2 = break148_g2.g;
				float4 break150_g2 = tex2D( _ColorVariationTexture, UV446_g2 );
				float S458_g2 = break150_g2.g;
				float4 break152_g2 = tex2D( _ColorVariationTexture, UV546_g2 );
				float S558_g2 = break152_g2.g;
				float4 break154_g2 = tex2D( _ColorVariationTexture, UV646_g2 );
				float S658_g2 = break154_g2.g;
				float4 break156_g2 = tex2D( _ColorVariationTexture, UV746_g2 );
				float S758_g2 = break156_g2.g;
				float4 break158_g2 = tex2D( _ColorVariationTexture, UV846_g2 );
				float S858_g2 = break158_g2.g;
				float3 localCombineSamplesSmooth58_g2 = CombineSamplesSmooth58_g2( Strength58_g2 , S058_g2 , S158_g2 , S258_g2 , S358_g2 , S458_g2 , S558_g2 , S658_g2 , S758_g2 , S858_g2 );
				float3 Normals366 = localCombineSamplesSmooth58_g2;
				#ifdef _DEBUG_ON
				float3 staticSwitch364 = float3(0,0,1);
				#else
				float3 staticSwitch364 = Normals366;
				#endif
				
				float4 temp_cast_3 = (0.0).xxxx;
				#ifdef _DEBUG_ON
				float4 staticSwitch357 = ( ( Water_Color73 * _DebugWaterColor ) + float4( ( Normals366 * _DebugNormals ) , 0.0 ) + ( Cloud_Noise37 * _DebugCloudNoise ) );
				#else
				float4 staticSwitch357 = temp_cast_3;
				#endif
				
				#ifdef _DEBUG_ON
				float staticSwitch362 = 0.0;
				#else
				float staticSwitch362 = _Smoothness;
				#endif
				
				float Opacity93 = step( 0.1 , tex2DNode83.r );
				float2 texCoord317 = input.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DEBUG_ON
				float staticSwitch360 = 1.0;
				#else
				float staticSwitch360 = ( Opacity93 * saturate( ( texCoord317.y * _InitialOpacityGradience ) ) * ( 1.0 - step( _BottomOpacityCutout , texCoord317.y ) ) );
				#endif
				

				float3 BaseColor = staticSwitch358.rgb;
				float3 Normal = staticSwitch364;
				float3 Emission = staticSwitch357.rgb;
				float3 Specular = 0.5;
				float Metallic = 0;
				float Smoothness = staticSwitch362;
				float Occlusion = 1;
				float Alpha = staticSwitch360;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color2;
			float4 _ColorVariationTexture_TexelSize;
			float4 _WaterfallStartNoise_ST;
			float4 _Color4;
			float4 _CloudNoise_ST;
			float4 _NoiseLines_ST;
			float4 _WaterfallEdge_ST;
			float4 _Color3;
			float4 _ColorVariationTexture_ST;
			float4 _Color1;
			float2 _StartNoiseHarshTiling;
			float2 _SmallDots2Scale;
			float2 _SmallDots1Scale;
			float _NormalStrength;
			float _SmallDots1Distortion;
			float _SmallDots1Opacity;
			float _StartNoiseHarshStep;
			float _Smoothness;
			float _StartNoiseHarshSpeed;
			float _StartNoiseHarshDistortion;
			float _StartNoiseharshTopPosition;
			float _StartNoiseharshTopBlend;
			float _StartNoiseharshBottomPosition;
			float _StartNoiseharshBottomBlend;
			float _SmallDots2Step;
			float _DebugCloudNoise;
			float _SmallDots1Speed;
			float _SmallDots2Distortion;
			float _SmallDots2Opacity;
			float _EdgeFoamStep;
			float _DebugNormals;
			float _EdgeFoamDistance;
			float _EdgeFoamOpacity;
			float _DebugWaterColor;
			float _SmallDots2Speed;
			float _ColorVariationContrast;
			float _WaterfallEdgeFoamOpacity;
			float _NoiseLinesSpeed;
			float _ColorVariationDepth;
			float _CloudNoiseSpeed;
			float _NoiseLinesDistortion;
			float _NoiseLinesOpacity;
			float _NoiseLinesReveal;
			float _NoiseLinesPow;
			float _ColorVariationSpeed;
			float _WaterfallStartNoiseSpeed;
			float _WaterfallStartNoiseDistortion;
			float _WaterfallStartNoiseDepth;
			float _WaterfallStartNoiseExtend;
			float _WaterfallStartNoisePow;
			float _WaterfallStartNoisePosition;
			float _WaterfallStartNoiseOpacity;
			float _BottomFoamStep;
			float _BottomFoamSpeed;
			float _BottomFoamDistortion;
			float _BottomFoamExtendMax;
			float _BottomFoamExtendMin;
			float _BottomFoamWidthPow;
			float _InitialOpacityGradience;
			float _WaterfallEdgeSpeed;
			float _SmallDots1Step;
			float _BottomOpacityCutout;
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

			sampler2D _WaterfallEdge;


			
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

				float2 uv_WaterfallEdge = input.ase_texcoord.xy * _WaterfallEdge_ST.xy + _WaterfallEdge_ST.zw;
				float mulTime79 = _TimeParameters.x * -_WaterfallEdgeSpeed;
				float2 appendResult81 = (float2(0.0 , mulTime79));
				float4 tex2DNode83 = tex2D( _WaterfallEdge, ( uv_WaterfallEdge + appendResult81 ) );
				float Opacity93 = step( 0.1 , tex2DNode83.r );
				float2 texCoord317 = input.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DEBUG_ON
				float staticSwitch360 = 1.0;
				#else
				float staticSwitch360 = ( Opacity93 * saturate( ( texCoord317.y * _InitialOpacityGradience ) ) * ( 1.0 - step( _BottomOpacityCutout , texCoord317.y ) ) );
				#endif
				

				surfaceDescription.Alpha = staticSwitch360;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color2;
			float4 _ColorVariationTexture_TexelSize;
			float4 _WaterfallStartNoise_ST;
			float4 _Color4;
			float4 _CloudNoise_ST;
			float4 _NoiseLines_ST;
			float4 _WaterfallEdge_ST;
			float4 _Color3;
			float4 _ColorVariationTexture_ST;
			float4 _Color1;
			float2 _StartNoiseHarshTiling;
			float2 _SmallDots2Scale;
			float2 _SmallDots1Scale;
			float _NormalStrength;
			float _SmallDots1Distortion;
			float _SmallDots1Opacity;
			float _StartNoiseHarshStep;
			float _Smoothness;
			float _StartNoiseHarshSpeed;
			float _StartNoiseHarshDistortion;
			float _StartNoiseharshTopPosition;
			float _StartNoiseharshTopBlend;
			float _StartNoiseharshBottomPosition;
			float _StartNoiseharshBottomBlend;
			float _SmallDots2Step;
			float _DebugCloudNoise;
			float _SmallDots1Speed;
			float _SmallDots2Distortion;
			float _SmallDots2Opacity;
			float _EdgeFoamStep;
			float _DebugNormals;
			float _EdgeFoamDistance;
			float _EdgeFoamOpacity;
			float _DebugWaterColor;
			float _SmallDots2Speed;
			float _ColorVariationContrast;
			float _WaterfallEdgeFoamOpacity;
			float _NoiseLinesSpeed;
			float _ColorVariationDepth;
			float _CloudNoiseSpeed;
			float _NoiseLinesDistortion;
			float _NoiseLinesOpacity;
			float _NoiseLinesReveal;
			float _NoiseLinesPow;
			float _ColorVariationSpeed;
			float _WaterfallStartNoiseSpeed;
			float _WaterfallStartNoiseDistortion;
			float _WaterfallStartNoiseDepth;
			float _WaterfallStartNoiseExtend;
			float _WaterfallStartNoisePow;
			float _WaterfallStartNoisePosition;
			float _WaterfallStartNoiseOpacity;
			float _BottomFoamStep;
			float _BottomFoamSpeed;
			float _BottomFoamDistortion;
			float _BottomFoamExtendMax;
			float _BottomFoamExtendMin;
			float _BottomFoamWidthPow;
			float _InitialOpacityGradience;
			float _WaterfallEdgeSpeed;
			float _SmallDots1Step;
			float _BottomOpacityCutout;
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

			sampler2D _WaterfallEdge;


			
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

				float2 uv_WaterfallEdge = input.ase_texcoord.xy * _WaterfallEdge_ST.xy + _WaterfallEdge_ST.zw;
				float mulTime79 = _TimeParameters.x * -_WaterfallEdgeSpeed;
				float2 appendResult81 = (float2(0.0 , mulTime79));
				float4 tex2DNode83 = tex2D( _WaterfallEdge, ( uv_WaterfallEdge + appendResult81 ) );
				float Opacity93 = step( 0.1 , tex2DNode83.r );
				float2 texCoord317 = input.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _DEBUG_ON
				float staticSwitch360 = 1.0;
				#else
				float staticSwitch360 = ( Opacity93 * saturate( ( texCoord317.y * _InitialOpacityGradience ) ) * ( 1.0 - step( _BottomOpacityCutout , texCoord317.y ) ) );
				#endif
				

				surfaceDescription.Alpha = staticSwitch360;
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
Node;AmplifyShaderEditor.RangedFloatNode;77;-4064,3136;Inherit;False;Property;_WaterfallEdgeSpeed;Waterfall Edge Speed;18;0;Create;True;0;0;0;False;0;False;0.2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.NegateNode;78;-3808,3136;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;91;-4176,2848;Inherit;True;Property;_WaterfallEdge;Waterfall Edge;19;0;Create;True;0;0;0;False;0;False;6c6e2a23ad2379b439393259ddaff19d;6c6e2a23ad2379b439393259ddaff19d;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleTimeNode;79;-3680,3136;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;80;-3888,2960;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;81;-3472,3136;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;82;-3296,3104;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;83;-3216,2848;Inherit;True;Property;_T_WaterfalEdgeOpacity;T_WaterfalEdgeOpacity;14;0;Create;True;0;0;0;False;0;False;-1;6c6e2a23ad2379b439393259ddaff19d;6c6e2a23ad2379b439393259ddaff19d;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.StepOpNode;84;-2848,2944;Inherit;False;2;0;FLOAT;0.1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;317;-1120,-128;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;325;-1216,96;Inherit;False;Property;_BottomOpacityCutout;Bottom Opacity Cutout;53;0;Create;True;0;0;0;False;0;False;0.9;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;321;-1184,0;Inherit;False;Property;_InitialOpacityGradience;Initial Opacity Gradience;52;0;Create;True;0;0;0;False;0;False;10;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;93;-2704,2944;Inherit;False;Opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;319;-864,-96;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;323;-832,16;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;320;-704,-96;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;324;-704,16;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;94;-736,-192;Inherit;False;93;Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;368;-6945.269,-2405.87;Inherit;False;692;339;Scene Depth;4;372;371;370;369;;1,1,1,1;0;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;318;-528,-128;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;361;-384,-64;Inherit;False;Constant;_Float1;Float 1;72;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-1376,-2000;Inherit;False;Property;_CloudNoiseSpeed;Cloud Noise Speed;6;0;Create;True;0;0;0;False;0;False;-0.1;-0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;26;-1408,-2272;Inherit;True;Property;_CloudNoise;Cloud Noise;7;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleTimeNode;32;-1152,-2000;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;28;-1168,-2144;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;33;-960,-2032;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;29;-784,-2144;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;369;-6895.269,-2275.87;Float;False;1;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenDepthNode;370;-6895.269,-2355.87;Inherit;False;0;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;56;-4016,2016;Inherit;False;Property;_ColorVariationSpeed;Color Variation Speed;10;0;Create;True;0;0;0;False;0;False;-0.1;-0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;27;-656,-2272;Inherit;True;Property;_TextureSample1;Texture Sample 1;7;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;3;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleSubtractOpNode;371;-6639.269,-2291.87;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;52;-3776,2016;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;49;-4096,1648;Inherit;True;Property;_ColorVariationTexture;Color Variation Texture;11;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RegisterLocalVarNode;37;-368,-2272;Inherit;False;Cloud Noise;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;372;-6495.269,-2291.87;Inherit;False;Scene Depth;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;50;-3840,1856;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;54;-3584,1984;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;373;-2608,-1664;Inherit;False;372;Scene Depth;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;375;-2608,-1568;Inherit;False;Property;_EdgeFoamDistance;Edge Foam Distance;60;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;151;-7552,96;Inherit;False;37;Cloud Noise;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;257;-3520,-1088;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;55;-3392,1856;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ViewVectorNode;58;-3296,1984;Inherit;False;Tangent;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;142;-7504,-560;Inherit;False;37;Cloud Noise;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;374;-2368,-1664;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;377;-2256,-1536;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;253;-4096,-1328;Inherit;False;Property;_BottomFoamSpeed;Bottom Foam Speed;38;0;Create;True;0;0;0;False;0;False;-0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;286;-4080,-1232;Inherit;False;37;Cloud Noise;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;298;-4288,-1936;Inherit;False;37;Cloud Noise;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;297;-4160,-2032;Inherit;False;Property;_StartNoiseHarshSpeed;Start Noise Harsh Speed;45;0;Create;True;0;0;0;False;0;False;-1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;153;-7376,96;Inherit;False;True;True;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;152;-7424,-16;Inherit;False;Property;_SmallDots2Speed;Small Dots 2 Speed;24;0;Create;True;0;0;0;False;0;False;-0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;268;-3248,-1056;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1;-4304,-352;Inherit;False;Property;_WaterfallStartNoiseSpeed;Waterfall Start Noise Speed;1;0;Create;True;0;0;0;False;0;False;0.2842633;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;39;-4304,-224;Inherit;False;37;Cloud Noise;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;309;-3585.854,-1749.999;Inherit;False;Property;_StartNoiseharshBottomPosition;Start Noise harsh Bottom Position;48;0;Create;True;0;0;0;False;0;False;0.4435484;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;311;-3552,-1632;Inherit;False;Property;_StartNoiseharshBottomBlend;Start Noise harsh Bottom Blend;50;0;Create;True;0;0;0;False;0;False;0.07522548;0;0;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;48;-3264,1648;Inherit;True;Property;_TextureSample2;Texture Sample 2;8;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;61;-3248,1872;Inherit;False;Property;_ColorVariationDepth;Color Variation Depth;12;0;Create;True;0;0;0;False;0;False;0.054;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.NormalizeNode;59;-3104,1984;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;132;-7376,-672;Inherit;False;Property;_SmallDots1Speed;Small Dots 1 Speed;25;0;Create;True;0;0;0;False;0;False;-0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;143;-7328,-560;Inherit;False;True;True;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;376;-2160,-1664;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;189;-3888,1024;Inherit;False;Property;_NoiseLinesSpeed;Noise Lines Speed;36;0;Create;True;0;0;0;False;0;False;-0.2;-0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;191;-3888,1168;Inherit;False;37;Cloud Noise;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode;2;-4448,-624;Inherit;True;Property;_WaterfallStartNoise;Waterfall Start Noise;0;0;Create;True;0;0;0;False;0;False;5592d5353472a1840880192b0a423e4c;5592d5353472a1840880192b0a423e4c;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleTimeNode;252;-3872,-1328;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;287;-3904,-1232;Inherit;False;True;True;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;285;-3968,-1168;Inherit;False;Property;_BottomFoamDistortion;Bottom Foam Distortion;43;0;Create;True;0;0;0;False;0;False;0.05;0;0;0.3;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;290;-3920,-2304;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;299;-4096,-1936;Inherit;False;True;True;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;301;-4160,-1856;Inherit;False;Property;_StartNoiseHarshDistortion;Start Noise Harsh Distortion;46;0;Create;True;0;0;0;False;0;False;0.026;0;0;0.2;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;293;-3952,-2176;Inherit;False;Property;_StartNoiseHarshTiling;Start Noise Harsh Tiling;44;0;Create;True;0;0;0;False;0;False;1,1;1,1;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleTimeNode;295;-3904,-2032;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;158;-7440,192;Inherit;False;Property;_SmallDots2Distortion;Small Dots 2 Distortion;31;0;Create;True;0;0;0;False;0;False;0.045;0;0;0.2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;156;-7200,-16;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;157;-7248,-144;Inherit;False;Property;_SmallDots2Scale;Small Dots 2 Scale;23;0;Create;True;0;0;0;False;0;False;1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.SimpleSubtractOpNode;159;-7168,96;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;154;-7264,-272;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.AbsOpNode;282;-3104,-1056;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;43;-4192,-128;Inherit;False;Property;_WaterfallStartNoiseDistortion;Waterfall Start Noise Distortion;8;0;Create;True;0;0;0;False;0;False;0.037;0;0;0.3;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;3;-4032,-352;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;41;-4128,-224;Inherit;False;True;True;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;310;-3270.854,-1680.999;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;305;-3536,-1984;Inherit;False;Property;_StartNoiseharshTopPosition;Start Noise harsh Top Position;47;0;Create;True;0;0;0;False;0;False;0.24;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;306;-3664,-1856;Inherit;False;Property;_StartNoiseharshTopBlend;Start Noise harsh Top Blend;49;0;Create;True;0;0;0;False;0;False;0.07522548;0;0;0.5;0;1;FLOAT;0
Node;AmplifyShaderEditor.ParallaxOffsetHlpNode;47;-2928,1760;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleTimeNode;133;-7152,-672;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;128;-7200,-800;Inherit;False;Property;_SmallDots1Scale;Small Dots 1 Scale;22;0;Create;True;0;0;0;False;0;False;1,1;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;141;-7392,-464;Inherit;False;Property;_SmallDots1Distortion;Small Dots 1 Distortion;30;0;Create;True;0;0;0;False;0;False;0.045;0;0;0.2;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;146;-7120,-560;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0.5,0.5;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;129;-7216,-928;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;378;-2016,-1664;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;-1;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;195;-3968,624;Inherit;True;Property;_NoiseLines;Noise Lines;37;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleTimeNode;188;-3680,1040;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;192;-3712,1168;Inherit;False;True;True;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;194;-3744,1248;Inherit;False;Property;_NoiseLinesDistortion;Noise Lines Distortion;35;0;Create;True;0;0;0;False;0;False;0.042;0;0;0.3;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;246;-4096,-1472;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;288;-3680,-1232;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;254;-3696,-1360;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;300;-3888,-1936;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;291;-3664,-2304;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;296;-3712,-2048;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;160;-7024,-272;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;162;-7008,96;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;161;-7024,-32;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;329;-2992,-1056;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;2;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;4;-4112,-496;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;5;-3856,-352;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;42;-3904,-224;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SmoothstepOpNode;304;-3168,-1760;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;307;-3296,-1920;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;60;-2672,1840;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;127;-6976,-928;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;145;-6960,-560;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;202;-6992,-448;Inherit;False;Constant;_Vector7;Vector 7;45;0;Create;True;0;0;0;False;0;False;0.32,0.27;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.DynamicAppendNode;134;-6976,-688;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexturePropertyNode;95;-7488,-912;Inherit;True;Property;_TopVoronoi;Top Voronoi;21;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SaturateNode;379;-1856,-1664;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;184;-3712,752;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DynamicAppendNode;190;-3488,1024;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;193;-3488,1184;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;251;-3488,-1456;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;294;-3472,-2176;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;163;-6832,-144;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;259;-2608,-896;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;260;-2704,-816;Inherit;False;Property;_BottomFoamExtendMin;Bottom Foam Extend Min;40;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;261;-2736,-736;Inherit;False;Property;_BottomFoamExtendMax;Bottom Foam Extend Max;41;0;Create;True;0;0;0;False;0;False;0.15;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;281;-2832,-1056;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;283;-3072,-944;Inherit;False;Property;_BottomFoamWidthPow;Bottom Foam Width Pow;39;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;6;-3520,-384;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ViewVectorNode;235;-3728,-96;Inherit;False;Tangent;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.TextureCoordinatesNode;17;-3712,96;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;18;-3776,224;Inherit;False;Property;_WaterfallStartNoisePosition;Waterfall Start Noise Position;2;0;Create;True;0;0;0;False;0;False;0.22;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;303;-3168,-1984;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;308;-2976,-1760;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;57;-2512,1680;Inherit;True;Property;_TextureSample3;Texture Sample 3;9;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SimpleAddOpNode;131;-6784,-800;Inherit;False;4;4;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;380;-1680,-1664;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;187;-3280,848;Inherit;False;3;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;247;-3200,-1440;Inherit;True;Property;_TextureSample9;Texture Sample 9;48;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;289;-3248,-2192;Inherit;True;Property;_TextureSample10;Texture Sample 10;55;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;150;-6512,-400;Inherit;True;Property;_TextureSample6;Texture Sample 5;26;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SmoothstepOpNode;258;-2432,-896;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;330;-2672,-1056;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;7;-3216,-624;Inherit;True;Property;_TextureSample0;Texture Sample 0;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.NormalizeNode;236;-3536,-96;Inherit;False;False;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;237;-3632,-208;Inherit;False;Property;_WaterfallStartNoiseDepth;Waterfall Start Noise Depth;9;0;Create;True;0;0;0;False;0;False;0.037;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;15;-3424,160;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;205;-3195.621,1182.456;Inherit;False;Property;_NoiseLinesReveal;Noise Lines Reveal;34;0;Create;True;0;0;0;False;0;False;0.8;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;164;-6224,-384;Inherit;False;Property;_SmallDots2Step;Small Dots 2 Step;27;0;Create;True;0;0;0;False;0;False;0.8;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;312;-2848,-1888;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;125;-6528,-880;Inherit;True;Property;_TextureSample5;Texture Sample 5;26;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SamplerNode;182;-3120,624;Inherit;True;Property;_TextureSample7;Texture Sample 7;39;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RangedFloatNode;137;-6224,-896;Inherit;False;Property;_SmallDots1Step;Small Dots 1 Step;26;0;Create;True;0;0;0;False;0;False;0.8;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;85;-2848,2784;Inherit;False;2;0;FLOAT;0.6;False;1;FLOAT;0.9;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;92;-2720,2848;Inherit;False;Property;_WaterfallEdgeFoamOpacity;Waterfall Edge Foam Opacity;20;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;279;-2224,-1104;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;263;-2352,-1216;Inherit;False;Property;_BottomFoamStep;Bottom Foam Step;42;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ParallaxOffsetHlpNode;234;-3344,-208;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PowerNode;204;-2944,1088;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;178;-3008,976;Inherit;False;Property;_NoiseLinesOpacity;Noise Lines Opacity;33;0;Create;True;0;0;0;False;0;False;0.8;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.AbsOpNode;16;-3264,160;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;25;-3424,352;Inherit;False;Property;_WaterfallStartNoisePow;Waterfall Start Noise Pow;5;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;22;-3424,272;Inherit;False;Property;_WaterfallStartNoiseExtend;Waterfall Start Noise Extend;4;0;Create;True;0;0;0;False;0;False;0.22;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;165;-5936,-352;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;166;-6064,-240;Inherit;False;Property;_SmallDots2Opacity;Small Dots 2 Opacity;29;0;Create;True;0;0;0;False;0;False;0.8;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;313;-2658.065,-2068.372;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;315;-2767.15,-2251.955;Inherit;False;Property;_StartNoiseHarshStep;Start Noise Harsh Step;51;0;Create;True;0;0;0;False;0;False;0.51;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;387;-1584,-1824;Inherit;False;Property;_EdgeFoamStep;Edge Foam Step;62;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;385;-1536,-1664;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;136;-5936,-864;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;138;-6064,-752;Inherit;False;Property;_SmallDots1Opacity;Small Dots 1 Opacity;28;0;Create;True;0;0;0;False;0;False;0.8;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;86;-2432,2784;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.5;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;262;-2048,-1168;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;243;-3112.361,-374.8425;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;177;-2704,896;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;76;-2480,1888;Inherit;False;Property;_ColorVariationContrast;Color Variation Contrast;17;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SmoothstepOpNode;19;-3104,160;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;327;-3056,304;Inherit;False;Property;_WaterfallStartNoiseOpacity;Waterfall Start Noise Opacity;3;0;Create;True;0;0;0;False;0;False;0.22;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;167;-5792,-352;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;314;-2464,-2144;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StepOpNode;386;-1312,-1744;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;381;-1408,-1632;Inherit;False;Property;_EdgeFoamOpacity;Edge Foam Opacity;61;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;135;-5792,-864;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;87;-2256,2784;Inherit;False;Watefal Edge;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;233;-2912,-320;Inherit;True;Property;_TextureSample8;Texture Sample 8;46;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SaturateNode;198;-2544,896;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;197;-2640,1008;Inherit;False;Property;_NoiseLinesPow;Noise Lines Pow;32;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;75;-2208,1760;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;328;-2768,192;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;65;-2448,1472;Inherit;False;Property;_Color1;Color 1;13;0;Create;True;0;0;0;False;0;False;0,0.8273995,1,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.ColorNode;66;-2448,1248;Inherit;False;Property;_Color2;Color 2;16;0;Create;True;0;0;0;False;0;False;0,0.5989819,0.8867924,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RegisterLocalVarNode;168;-5632,-352;Inherit;False;Small Dots 2;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;316;-2304,-2144;Inherit;False;Start Noise Harsh;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;388;-1184,-1712;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;139;-5632,-864;Inherit;False;Small Dots 1;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;69;-912,-1472;Inherit;False;264;Bottom Foam;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;88;-912,-1376;Inherit;False;87;Watefal Edge;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;245;-2549.641,49.97424;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;62;-2096,1408;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;196;-2368,896;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;201;-2448,1040;Inherit;False;Property;_Color3;Color 3;14;0;Create;True;0;0;0;False;0;False;0,0.5989819,0.8867924,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.GetLocalVarNode;171;-896,-1008;Inherit;False;168;Small Dots 2;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;180;-928,-1120;Inherit;False;316;Start Noise Harsh;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;382;-1024,-1712;Inherit;False;Edge Foam;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;140;-912,-1200;Inherit;False;139;Small Dots 1;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;147;-656,-1424;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;239;-2320,320;Inherit;False;Property;_Color4;Color 4;15;0;Create;True;0;0;0;False;0;False;0,0.5989819,0.8867924,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SaturateNode;242;-2336,48;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;199;-2001.13,1112.294;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;333;-1520,512;Inherit;False;Property;_NormalStrength;Normal Strength;55;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;169;-656,-1120;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;384;-672,-992;Inherit;False;382;Edge Foam;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;149;-512,-1344;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;238;-1968,256;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;334;-1152,576;Inherit;False;Normal From Texture;-1;;2;9728ee98a55193249b513caf9a0f1676;13,149,1,147,1,143,1,141,1,139,1,151,1,137,1,153,1,159,1,157,1,155,1,135,1,108,1;4;87;SAMPLER2D;0;False;85;FLOAT2;0,0;False;74;SAMPLERSTATE;0;False;91;FLOAT;1.5;False;2;FLOAT3;40;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;383;-496,-1088;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;181;-352,-1200;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;73;-1808,256;Inherit;False;Water Color;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;366;-848,576;Inherit;False;Normals;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;71;-224,-1200;Inherit;False;Foam Mask;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;337;-960,1584;Inherit;False;73;Water Color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;338;-1056,1664;Inherit;False;Property;_DebugWaterColor;DebugWaterColor;57;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;339;-1056,1824;Inherit;False;Property;_DebugNormals;DebugNormals;58;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;340;-960,1744;Inherit;False;366;Normals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;347;-960,1904;Inherit;False;37;Cloud Noise;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;348;-1056,1984;Inherit;False;Property;_DebugCloudNoise;Debug Cloud Noise;59;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;74;-560,-768;Inherit;False;73;Water Color;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;72;-560,-672;Inherit;False;71;Foam Mask;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;349;-768,1584;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;350;-768,1744;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;354;-768,1904;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;67;-368,-768;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;1,1,1,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;331;-592,-544;Inherit;False;Property;_Smoothness;Smoothness;54;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;355;-496.6146,1684.933;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;356;-384.6146,1396.933;Inherit;False;Constant;_Float2;Float 2;71;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;359;-227.2147,-639.9574;Inherit;False;Constant;_Float0;Float 0;71;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;363;-480,-416;Inherit;False;Constant;_Float3;Float 3;73;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;365;-256,-352;Inherit;False;Constant;_Vector0;Vector 0;74;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.GetLocalVarNode;367;-256,-416;Inherit;False;366;Normals;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;332;-1136,416;Inherit;False;Normal From Height;-1;;3;1942fe2c5f1a1f94881a33d532e4afeb;0;2;20;FLOAT;0;False;110;FLOAT;1;False;2;FLOAT3;40;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;358;-176,-768;Inherit;False;Property;_DEBUG;DEBUG;56;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;357;-224.6146,1412.933;Inherit;False;Property;_DEBUG5;DEBUG;56;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;358;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;362;-192,-512;Inherit;False;Property;_DEBUG7;DEBUG;56;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;358;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;364;-48,-384;Inherit;False;Property;_DEBUG8;DEBUG;56;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;358;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;360;-224,-128;Inherit;False;Property;_DEBUG6;DEBUG;56;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;358;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;264;-1936,-1168;Inherit;False;Bottom Foam;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;389;320,-688;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;390;320,-688;Float;False;True;-1;3;UnityEditor.ShaderGraphLitGUI;0;12;NewWaterfall;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;21;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;43;Lighting Model;0;0;Workflow;1;0;Surface;1;638808516819379875;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Alpha Clipping;0;638808516838912592;  Use Shadow Threshold;0;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;Receive Shadows;1;0;Receive SSAO;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;391;320,-688;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;392;320,-688;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;True;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;393;320,-688;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;394;320,-688;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;395;320,-688;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;396;320,-688;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;397;320,-688;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;398;320,-688;Float;False;False;-1;3;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
WireConnection;78;0;77;0
WireConnection;79;0;78;0
WireConnection;80;2;91;0
WireConnection;81;1;79;0
WireConnection;82;0;80;0
WireConnection;82;1;81;0
WireConnection;83;0;91;0
WireConnection;83;1;82;0
WireConnection;83;7;91;1
WireConnection;84;1;83;1
WireConnection;93;0;84;0
WireConnection;319;0;317;2
WireConnection;319;1;321;0
WireConnection;323;0;325;0
WireConnection;323;1;317;2
WireConnection;320;0;319;0
WireConnection;324;0;323;0
WireConnection;318;0;94;0
WireConnection;318;1;320;0
WireConnection;318;2;324;0
WireConnection;32;0;34;0
WireConnection;28;2;26;0
WireConnection;33;0;32;0
WireConnection;29;0;28;0
WireConnection;29;1;33;0
WireConnection;27;0;26;0
WireConnection;27;1;29;0
WireConnection;27;7;26;1
WireConnection;371;0;370;0
WireConnection;371;1;369;4
WireConnection;52;0;56;0
WireConnection;37;0;27;0
WireConnection;372;0;371;0
WireConnection;50;2;49;0
WireConnection;54;1;52;0
WireConnection;55;0;50;0
WireConnection;55;1;54;0
WireConnection;374;0;373;0
WireConnection;374;1;375;0
WireConnection;377;0;375;0
WireConnection;153;0;151;0
WireConnection;268;0;257;1
WireConnection;48;0;49;0
WireConnection;48;1;55;0
WireConnection;48;7;49;1
WireConnection;59;0;58;0
WireConnection;143;0;142;0
WireConnection;376;0;374;0
WireConnection;376;1;377;0
WireConnection;252;0;253;0
WireConnection;287;0;286;0
WireConnection;299;0;298;0
WireConnection;295;0;297;0
WireConnection;156;0;152;0
WireConnection;159;0;153;0
WireConnection;282;0;268;0
WireConnection;3;0;1;0
WireConnection;41;0;39;0
WireConnection;310;0;309;0
WireConnection;310;1;311;0
WireConnection;47;0;48;2
WireConnection;47;1;61;0
WireConnection;47;2;59;0
WireConnection;133;0;132;0
WireConnection;146;0;143;0
WireConnection;378;0;376;0
WireConnection;188;0;189;0
WireConnection;192;0;191;0
WireConnection;246;2;2;0
WireConnection;288;0;287;0
WireConnection;288;1;285;0
WireConnection;254;1;252;0
WireConnection;300;0;299;0
WireConnection;300;1;301;0
WireConnection;291;0;290;0
WireConnection;291;1;293;0
WireConnection;296;1;295;0
WireConnection;160;0;154;0
WireConnection;160;1;157;0
WireConnection;162;0;159;0
WireConnection;162;1;158;0
WireConnection;161;1;156;0
WireConnection;329;0;282;0
WireConnection;4;2;2;0
WireConnection;5;1;3;0
WireConnection;42;0;41;0
WireConnection;42;1;43;0
WireConnection;304;0;290;2
WireConnection;304;1;309;0
WireConnection;304;2;310;0
WireConnection;307;0;305;0
WireConnection;307;1;306;0
WireConnection;60;0;47;0
WireConnection;60;1;55;0
WireConnection;127;0;129;0
WireConnection;127;1;128;0
WireConnection;145;0;146;0
WireConnection;145;1;141;0
WireConnection;134;1;133;0
WireConnection;379;0;378;0
WireConnection;184;2;195;0
WireConnection;190;1;188;0
WireConnection;193;0;192;0
WireConnection;193;1;194;0
WireConnection;251;0;246;0
WireConnection;251;1;254;0
WireConnection;251;2;288;0
WireConnection;294;0;291;0
WireConnection;294;1;296;0
WireConnection;294;2;300;0
WireConnection;163;0;160;0
WireConnection;163;1;161;0
WireConnection;163;2;162;0
WireConnection;259;0;257;2
WireConnection;281;0;329;0
WireConnection;6;0;4;0
WireConnection;6;1;5;0
WireConnection;6;2;42;0
WireConnection;303;0;290;2
WireConnection;303;1;305;0
WireConnection;303;2;307;0
WireConnection;308;0;304;0
WireConnection;57;0;49;0
WireConnection;57;1;60;0
WireConnection;57;7;49;1
WireConnection;131;0;127;0
WireConnection;131;1;134;0
WireConnection;131;2;145;0
WireConnection;131;3;202;0
WireConnection;380;0;379;0
WireConnection;380;1;57;2
WireConnection;187;0;184;0
WireConnection;187;1;190;0
WireConnection;187;2;193;0
WireConnection;247;0;2;0
WireConnection;247;1;251;0
WireConnection;247;7;2;1
WireConnection;289;0;2;0
WireConnection;289;1;294;0
WireConnection;150;0;95;0
WireConnection;150;1;163;0
WireConnection;150;7;95;1
WireConnection;258;0;259;0
WireConnection;258;1;261;0
WireConnection;258;2;260;0
WireConnection;330;0;281;0
WireConnection;330;1;283;0
WireConnection;7;0;2;0
WireConnection;7;1;6;0
WireConnection;7;7;2;1
WireConnection;236;0;235;0
WireConnection;15;0;17;2
WireConnection;15;1;18;0
WireConnection;312;0;303;0
WireConnection;312;1;308;0
WireConnection;125;0;95;0
WireConnection;125;1;131;0
WireConnection;125;7;95;1
WireConnection;182;0;195;0
WireConnection;182;1;187;0
WireConnection;182;7;195;1
WireConnection;85;1;83;1
WireConnection;279;0;247;2
WireConnection;279;1;258;0
WireConnection;279;2;330;0
WireConnection;234;0;7;2
WireConnection;234;1;237;0
WireConnection;234;2;236;0
WireConnection;204;0;48;2
WireConnection;204;1;205;0
WireConnection;16;0;15;0
WireConnection;165;0;164;0
WireConnection;165;1;150;2
WireConnection;313;0;289;2
WireConnection;313;1;312;0
WireConnection;385;0;380;0
WireConnection;136;0;137;0
WireConnection;136;1;125;2
WireConnection;86;0;85;0
WireConnection;86;1;92;0
WireConnection;262;0;263;0
WireConnection;262;1;279;0
WireConnection;243;0;6;0
WireConnection;243;1;234;0
WireConnection;177;0;182;2
WireConnection;177;1;178;0
WireConnection;177;2;204;0
WireConnection;19;0;16;0
WireConnection;19;1;22;0
WireConnection;19;2;25;0
WireConnection;167;0;165;0
WireConnection;167;1;166;0
WireConnection;314;0;315;0
WireConnection;314;1;313;0
WireConnection;386;0;387;0
WireConnection;386;1;385;0
WireConnection;135;0;136;0
WireConnection;135;1;138;0
WireConnection;87;0;86;0
WireConnection;233;0;2;0
WireConnection;233;1;243;0
WireConnection;233;7;2;1
WireConnection;198;0;177;0
WireConnection;75;0;57;2
WireConnection;75;1;76;0
WireConnection;328;0;19;0
WireConnection;328;1;327;0
WireConnection;168;0;167;0
WireConnection;316;0;314;0
WireConnection;388;0;386;0
WireConnection;388;1;381;0
WireConnection;139;0;135;0
WireConnection;245;0;233;2
WireConnection;245;1;328;0
WireConnection;62;0;66;0
WireConnection;62;1;65;0
WireConnection;62;2;75;0
WireConnection;196;0;198;0
WireConnection;196;1;197;0
WireConnection;382;0;388;0
WireConnection;147;0;69;0
WireConnection;147;1;88;0
WireConnection;242;0;245;0
WireConnection;199;0;62;0
WireConnection;199;1;201;0
WireConnection;199;2;196;0
WireConnection;169;0;180;0
WireConnection;169;1;171;0
WireConnection;149;0;147;0
WireConnection;149;1;140;0
WireConnection;238;0;199;0
WireConnection;238;1;239;5
WireConnection;238;2;242;0
WireConnection;334;87;49;0
WireConnection;334;85;55;0
WireConnection;334;74;49;1
WireConnection;334;91;333;0
WireConnection;383;0;169;0
WireConnection;383;1;384;0
WireConnection;181;0;149;0
WireConnection;181;1;383;0
WireConnection;73;0;238;0
WireConnection;366;0;334;40
WireConnection;71;0;181;0
WireConnection;349;0;337;0
WireConnection;349;1;338;0
WireConnection;350;0;340;0
WireConnection;350;1;339;0
WireConnection;354;0;347;0
WireConnection;354;1;348;0
WireConnection;67;0;74;0
WireConnection;67;2;72;0
WireConnection;355;0;349;0
WireConnection;355;1;350;0
WireConnection;355;2;354;0
WireConnection;332;20;57;2
WireConnection;332;110;333;0
WireConnection;358;1;67;0
WireConnection;358;0;359;0
WireConnection;357;1;356;0
WireConnection;357;0;355;0
WireConnection;362;1;331;0
WireConnection;362;0;363;0
WireConnection;364;1;367;0
WireConnection;364;0;365;0
WireConnection;360;1;318;0
WireConnection;360;0;361;0
WireConnection;264;0;262;0
WireConnection;390;0;358;0
WireConnection;390;1;364;0
WireConnection;390;2;357;0
WireConnection;390;4;362;0
WireConnection;390;6;360;0
ASEEND*/
//CHKSM=ECB2ECECA4623633C5BE84846024E6D6562CCC8F