Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83121C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 16:09:34 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.925.1743782965348134913
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Apr 2025 09:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ZQi706V1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f193.google.com with SMTP id d75a77b69052e-4769f3e19a9so15024121cf.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 04 Apr 2025 09:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1743782964; x=1744387764; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3eiO5ZMBE8PdAvWPgxpdm2I48GvjRN6nx2e5VoeYTSw=;
        b=ZQi706V1XVumtj5DTpd59Ef3M3FzRDdgFryEBHAu2bafR3nQ/wY+LeQadRbWVPKna7
         FVN3xd56sgnRESRKIJPaWGZtQO55VXJq/Yez2P8beJ3aFPKe8sr/YE3eo1V7OuCse/cG
         ylPgZbhDLBjjv4KezKCvfr+qAjviZUdy5u6/SzIYIbyJCFGQ4W7fuM9nu7CC5Pd75ijp
         DBGOgN2zl5WibqzYmBtPA9+439hElMhA4MlA7Xse/S9jHbwB0KHqXuWOEejtz4Gd3w45
         4LXJCKs8dZWFL0Po3xMqI42y9odmek+ObOKEY4lsoVbcYcAZqAseSm97JsLBLVlNGLLM
         fGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743782964; x=1744387764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3eiO5ZMBE8PdAvWPgxpdm2I48GvjRN6nx2e5VoeYTSw=;
        b=PZaw8GeG3KAUqWhurQq9h6by1ho6Wv0RKdneVLCQyOrvZTS43/AfTNI1klYXZ7piAQ
         hMINjh62DkNqCaJs+sBkKbpT+47Qp7W3fCaRAJeJX7Ah+wDU504esN+7H+PPuwoXFx8b
         c9XKRydGB0CyCNelHG3ezZlbOndFCgb8PjtNbclaSV8VwhhXxaIp4hnNM7jH5WiwBJHc
         iU87F068FDrtzD8+bl2vix0S8KemATjOsp2CD/jFGX0l10tKmtDZYlQ3TlCsWpL8x+jY
         xrwwWGd5n4RQKTVx/2BrtMOPtwCdI/xDbBjqZe7jyUtr/EuVDIWTSnRKRrfpZiienmdJ
         0SWA==
X-Gm-Message-State: AOJu0Yy+ZL7mQZ8ba1IJwjOVSKV8U1uCF0YMYD0AAV1UHhuEFQqdLzSg
	WZY22hcxt2FP+wKyqDIFJIij/0u/L5Rwcs9FAIKf8oemjO+IwILEEsquSnLOPJCIul1LD10337V
	1loFn
X-Gm-Gg: ASbGnctQkCXEMTRx1XQ0O275KePDIyvkhRNExDnasV8gzhP45DIWhxTVHUr0UGiSJFX
	T/8pbUd4omGA4DxbKeQ3RxkjylvgP4lYR71W0NZpAAACHKDipYSJZ9IiJBPbpAYiEvug9GzeYSC
	7cCtuzyTARs7SUaZw0H0RtSo0U/V2tNniM8dFchi5duC02JHV64Im8xFpz3O7pQb60ItEfjeWG/
	hwVKEzuObmZy0uQz86N9yd1it4ZCD/waHc8A7fRu+vNjxCO9Vt4nxrf5zdHMyUx4/+PYZK0SHeM
	D2Nmivl7fYuyjO5nabCWVKr0jpAS0h91MN5X
X-Google-Smtp-Source: AGHT+IEuK4Xn1x+sgSJAgevahkGvRwA+eBavb3qJWeMk8DUyExA+fCBA9cu9fs+w+iSQBRHmbigo7Q==
X-Received: by 2002:ac8:7d8a:0:b0:477:704a:a580 with SMTP id d75a77b69052e-4792594e7efmr60969111cf.13.1743782963850;
        Fri, 04 Apr 2025 09:09:23 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b057e6csm23744721cf.13.2025.04.04.09.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 09:09:23 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	martin.jansa@gmail.com
Subject: Re: [PATCH] metadata: add whitespace around assignments
Date: Fri,  4 Apr 2025 12:09:10 -0400
Message-Id: <174378295341.1062697.14313496422160639933.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404091725.3422368-1-martin.jansa@gmail.com>
References: <20250404091725.3422368-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Apr 2025 16:09:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6444


On Fri, 04 Apr 2025 11:17:25 +0200, martin.jansa@gmail.com wrote:
> With:
> https://lists.openembedded.org/g/bitbake-devel/message/17508
> there are WARNINGs like:
> 
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb:3 has a lack of whitespace around the assignment: 'SP_INDEX="1"'
> WARNING: meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_13.3.rel1.bb: meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc:31 has a lack of whitespace around the assignment: 'SKIP_FILEDEPS="1"'
> WARNING: meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_13.3.rel1.bb: meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc:31 has a lack of whitespace around the assignment: 'SKIP_FILEDEPS="1"'
> WARNING: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb:38 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.12.bb: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc:80 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.1.bb: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc:80 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc:80 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.1.1.bb: meta-arm/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc:89 has a lack of whitespace around the assignment: 'export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"'
> WARNING: meta-arm/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.6.0.bb: meta-arm/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.6.0.bb:34 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb: meta-arm/meta-arm/recipes-devtools/fvp/fvp-common.inc:42 has a lack of whitespace around the assignment: 'PV_URL_SHORT="${@get_fm_short_pv_url(d)}"'
> WARNING: meta-arm/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb: meta-arm/meta-arm/recipes-devtools/fvp/fvp-common.inc:42 has a lack of whitespace around the assignment: 'PV_URL_SHORT="${@get_fm_short_pv_url(d)}"'
> WARNING: meta-arm/meta-arm/recipes-devtools/fvp/fvp-library.bb: meta-arm/meta-arm/recipes-devtools/fvp/fvp-common.inc:42 has a lack of whitespace around the assignment: 'PV_URL_SHORT="${@get_fm_short_pv_url(d)}"'
> WARNING: meta-arm/meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb: meta-arm/meta-arm/recipes-devtools/fvp/fvp-common.inc:42 has a lack of whitespace around the assignment: 'PV_URL_SHORT="${@get_fm_short_pv_url(d)}"'
> WARNING: meta-arm/meta-arm/recipes-devtools/fvp/fvp-sgi575.bb: meta-arm/meta-arm/recipes-devtools/fvp/fvp-common.inc:42 has a lack of whitespace around the assignment: 'PV_URL_SHORT="${@get_fm_short_pv_url(d)}"'
> WARNING: meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb: meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb:21 has a lack of whitespace around the assignment: 'FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"'
> WARNING: meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb: meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb:53 has a lack of whitespace around the assignment: 'export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"'
> WARNING: meta-arm/meta-arm/recipes-security/optee/optee-examples_4.3.0.bb: meta-arm/meta-arm/recipes-security/optee/optee.inc:34 has a lack of whitespace around the assignment: 'export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"'
> WARNING: meta-arm/meta-arm/recipes-security/optee/optee-os-tadevkit_4.3.0.bb: meta-arm/meta-arm/recipes-security/optee/optee.inc:34 has a lack of whitespace around the assignment: 'export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"'
> WARNING: meta-arm/meta-arm/recipes-security/optee/optee-os_4.3.0.bb: meta-arm/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend:1 has a lack of whitespace around the assignment: 'FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"'
> WARNING: meta-arm/meta-arm/recipes-security/optee/optee-os_4.3.0.bb: meta-arm/meta-arm/recipes-security/optee/optee-os-ts.inc:11 has a lack of whitespace around the assignment: 'TS_BIN_SPM_TEST= "${RECIPE_SYSROOT}/usr/opteesp/bin"'
> WARNING: meta-arm/meta-arm/recipes-security/optee/optee-os_4.3.0.bb: meta-arm/meta-arm/recipes-security/optee/optee.inc:34 has a lack of whitespace around the assignment: 'export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"'
> WARNING: meta-arm/meta-arm/recipes-security/optee/optee-test_4.3.0.bb: meta-arm/meta-arm/recipes-security/optee/optee.inc:34 has a lack of whitespace around the assignment: 'export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/libts_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/libts_git.bb:12 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/libts/${TS_ENV}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/libts_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-demo_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-demo_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-demo_git.bb:13 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/ts-demo/${TS_ENV}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-psa-crypto-api-test_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-psa-its-api-test_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-psa-ps-api-test_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-remote-test_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-service-test_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb:8 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/attestation/config/${TS_SP_IAT_CONFIG}-${TS_ENV}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-block-storage_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-block-storage_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-block-storage_git.bb:13 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/block-storage/config/${TS_SP_BLOCK_STORAGE_CONFIG}-${TS_ENV}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-block-storage_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb:10 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/crypto/config/${TS_SP_CRYPTO_CONFIG}-${TS_ENV}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb:14 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/fwu/config/${TS_SP_FWU_CONFIG}-${TS_ENV}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb:8 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/internal-trusted-storage/config/${TS_SP_ITS_CONFIG}-${TS_ENV}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb:10 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/se-proxy/config/${TS_SP_SE_PROXY_CONFIG}-${TS_ENV}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb:8 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/smm-gateway/config/${TS_SP_SMM_GATEWAY_CONFIG}-${TS_ENV}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-common.inc:10 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/spm-test${SP_INDEX}/${TS_ENV}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb:3 has a lack of whitespace around the assignment: 'SP_INDEX="1"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test2_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test2_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test2_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-common.inc:10 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/spm-test${SP_INDEX}/${TS_ENV}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test2_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test2_git.bb:3 has a lack of whitespace around the assignment: 'SP_INDEX="2"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test3_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test3_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test3_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-common.inc:10 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/spm-test${SP_INDEX}/${TS_ENV}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test3_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test3_git.bb:3 has a lack of whitespace around the assignment: 'SP_INDEX="3"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test4_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test4_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test4_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-common.inc:10 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/spm-test${SP_INDEX}/${TS_ENV}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test4_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test4_git.bb:3 has a lack of whitespace around the assignment: 'SP_INDEX="4"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb:8 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/protected-storage/config/${TS_SP_PS_CONFIG}-${TS_ENV}"'
> WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-uefi-test_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
> 
> [...]

Applied, thanks!

[1/1] metadata: add whitespace around assignments
      commit: eddf97401ac05a3148cd3368e2a2380ca43d5fd7

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

