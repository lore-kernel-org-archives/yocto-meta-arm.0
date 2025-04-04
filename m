Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD2CC36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 09:17:42 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.7127.1743758252434843731
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 04 Apr 2025 02:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DYD9AqmA;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso330240366b.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 04 Apr 2025 02:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743758251; x=1744363051; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WPBNncyK02ih+eW2fD89UC0NsoK2KPhiAX9L6ndmV+Q=;
        b=DYD9AqmAfNNT/N7aDBy+efWCdwCPaGQFNsOU/2D9/wHQqn6qIxp/sx6NlVlTEHlrKa
         0ZMUfAwbhXZ/PJuFPuj3VxJt0jXGpyIznSEVvF/thoKu8d3gQqXcaxWtY/hU05t00VH7
         DSWG8hDsO/wzkc0zCOPyi/3eFoqKNw9RW9acasqh2C7B8XeMXCJ6rMS5G/CLO4GxrgAs
         K0yDr5DbiElTdaQXDPVPIzY/i8vMEao+8fDsn7pv6lYAwUKXXnV2fPqGmY8NSoKkxpU1
         Ew4njBZtM8eBhWDRV+du/vEe5eNoLGNF02jJs2taj0SLz9JQBUBM76Pc4xwuA6wE//QF
         Oorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743758251; x=1744363051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPBNncyK02ih+eW2fD89UC0NsoK2KPhiAX9L6ndmV+Q=;
        b=C6wcpe0ZoS6H4WOakcx2RmRzlcqqfIG5gMboY3G2GzdfgY9qhMqjUm3Qaf//Sx7WNb
         CF7B7MgS1mbOBiaeDT5KiNYCr9JR4TTjCt/RwStJK9m8Pt6casfMjejaQViKRdxNgwg+
         ipHNdb0yrwjgcU0egVH6jqjnVirZBE3Db17Pd3RF0ihFlBAX7cmEoT9iXBeuiaxSZkcY
         P55TEISthzrtasx9MLkfFpT52G0QRyFtJ4HIbxWJjTeYu5FJy+pMX7f1YREUS+ttLk0U
         Fj8c4c8O3m76u9aL647IhfHATuIANEWR9AMMaJfbHoM5mX7T3pkPwDTA/j10R4Xf5m/B
         hwWg==
X-Gm-Message-State: AOJu0YyRarSZgj9sih0tnO52QL2KfRaTFHMLL+7hBs+TvqiMPMIwEXyJ
	pR9jJUqsh7wIqnoRthMH/KAizzbtUxgzSAn8AJxJxyWGxOsYrCrW6HYqKkJN
X-Gm-Gg: ASbGncuNQaC9KFdjW51YA0NvckoNtWdoaUvYiv24VvsYyYvMU+5artWFDVBX/Ia9CKW
	sz5aomH8HBA0Aip57SJEpXa26l0nh4hkBWwTQeDc0iHbgPZ4lX3jcEzx32a+7huwZ0ssgeVB+oY
	vyUj5ItZa9R6dw4ZgwpmNMMpcZpzbAthqEl+RtTPZCvHS1Ha7806jX4237Hp86BUfbdzYg28J8V
	CmeVlnU8TqZ1wQhe4h5o7hGBCmhbXqfT1cn8JmN0AvmgU2DQwHYQcrmueekL/8dhohMbIBDk700
	sgqE14i0/25hQSAM5IsFmr6sZfDfON5vKF5mtebbeD04OQ8jK1X5VUlVUDqU5JgaMsB7HWGU4yG
	rxg==
X-Google-Smtp-Source: AGHT+IEx8KeRVe2lh8zdkt1wDkFjoOE10M0sPJBeLVj3DbLEgJbxzi8zdXGK7JCC1EDThiSWjYZmIA==
X-Received: by 2002:a17:907:6096:b0:ac6:dd55:36d8 with SMTP id a640c23a62f3a-ac7d1c3ab14mr246314866b.44.1743758250379;
        Fri, 04 Apr 2025 02:17:30 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac7bfe99c7dsm223321666b.57.2025.04.04.02.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 02:17:29 -0700 (PDT)
From: martin.jansa@gmail.com
To: meta-arm@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] metadata: add whitespace around assignments
Date: Fri,  4 Apr 2025 11:17:25 +0200
Message-ID: <20250404091725.3422368-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 04 Apr 2025 09:17:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6442

From: Martin Jansa <martin.jansa@gmail.com>

With:
https://lists.openembedded.org/g/bitbake-devel/message/17508
there are WARNINGs like:

WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb:3 has a lack of whitespace around the assignment: 'SP_INDEX="1"'
WARNING: meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-aarch64-none-elf_13.3.rel1.bb: meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc:31 has a lack of whitespace around the assignment: 'SKIP_FILEDEPS="1"'
WARNING: meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/gcc-arm-none-eabi_13.3.rel1.bb: meta-arm/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc:31 has a lack of whitespace around the assignment: 'SKIP_FILEDEPS="1"'
WARNING: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb:38 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.10.12.bb: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc:80 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.12.1.bb: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc:80 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_git.bb: meta-arm/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc:80 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.1.1.bb: meta-arm/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc:89 has a lack of whitespace around the assignment: 'export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"'
WARNING: meta-arm/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.6.0.bb: meta-arm/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.6.0.bb:34 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-devtools/fvp/fvp-base-a-aem_11.28.23.bb: meta-arm/meta-arm/recipes-devtools/fvp/fvp-common.inc:42 has a lack of whitespace around the assignment: 'PV_URL_SHORT="${@get_fm_short_pv_url(d)}"'
WARNING: meta-arm/meta-arm/recipes-devtools/fvp/fvp-corstone1000.bb: meta-arm/meta-arm/recipes-devtools/fvp/fvp-common.inc:42 has a lack of whitespace around the assignment: 'PV_URL_SHORT="${@get_fm_short_pv_url(d)}"'
WARNING: meta-arm/meta-arm/recipes-devtools/fvp/fvp-library.bb: meta-arm/meta-arm/recipes-devtools/fvp/fvp-common.inc:42 has a lack of whitespace around the assignment: 'PV_URL_SHORT="${@get_fm_short_pv_url(d)}"'
WARNING: meta-arm/meta-arm/recipes-devtools/fvp/fvp-n1-edge.bb: meta-arm/meta-arm/recipes-devtools/fvp/fvp-common.inc:42 has a lack of whitespace around the assignment: 'PV_URL_SHORT="${@get_fm_short_pv_url(d)}"'
WARNING: meta-arm/meta-arm/recipes-devtools/fvp/fvp-sgi575.bb: meta-arm/meta-arm/recipes-devtools/fvp/fvp-common.inc:42 has a lack of whitespace around the assignment: 'PV_URL_SHORT="${@get_fm_short_pv_url(d)}"'
WARNING: meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb: meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb:21 has a lack of whitespace around the assignment: 'FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"'
WARNING: meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb: meta-arm/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb:53 has a lack of whitespace around the assignment: 'export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"'
WARNING: meta-arm/meta-arm/recipes-security/optee/optee-examples_4.3.0.bb: meta-arm/meta-arm/recipes-security/optee/optee.inc:34 has a lack of whitespace around the assignment: 'export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"'
WARNING: meta-arm/meta-arm/recipes-security/optee/optee-os-tadevkit_4.3.0.bb: meta-arm/meta-arm/recipes-security/optee/optee.inc:34 has a lack of whitespace around the assignment: 'export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"'
WARNING: meta-arm/meta-arm/recipes-security/optee/optee-os_4.3.0.bb: meta-arm/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend:1 has a lack of whitespace around the assignment: 'FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"'
WARNING: meta-arm/meta-arm/recipes-security/optee/optee-os_4.3.0.bb: meta-arm/meta-arm/recipes-security/optee/optee-os-ts.inc:11 has a lack of whitespace around the assignment: 'TS_BIN_SPM_TEST= "${RECIPE_SYSROOT}/usr/opteesp/bin"'
WARNING: meta-arm/meta-arm/recipes-security/optee/optee-os_4.3.0.bb: meta-arm/meta-arm/recipes-security/optee/optee.inc:34 has a lack of whitespace around the assignment: 'export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"'
WARNING: meta-arm/meta-arm/recipes-security/optee/optee-test_4.3.0.bb: meta-arm/meta-arm/recipes-security/optee/optee.inc:34 has a lack of whitespace around the assignment: 'export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/libts_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/libts_git.bb:12 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/libts/${TS_ENV}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/libts_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-demo_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-demo_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-demo_git.bb:13 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/ts-demo/${TS_ENV}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-psa-crypto-api-test_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-psa-iat-api-test_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-psa-its-api-test_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-psa-ps-api-test_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-remote-test_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-service-test_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb:8 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/attestation/config/${TS_SP_IAT_CONFIG}-${TS_ENV}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-block-storage_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-block-storage_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-block-storage_git.bb:13 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/block-storage/config/${TS_SP_BLOCK_STORAGE_CONFIG}-${TS_ENV}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-block-storage_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb:10 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/crypto/config/${TS_SP_CRYPTO_CONFIG}-${TS_ENV}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb:14 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/fwu/config/${TS_SP_FWU_CONFIG}-${TS_ENV}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb:8 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/internal-trusted-storage/config/${TS_SP_ITS_CONFIG}-${TS_ENV}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb:10 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/se-proxy/config/${TS_SP_SE_PROXY_CONFIG}-${TS_ENV}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb:8 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/smm-gateway/config/${TS_SP_SMM_GATEWAY_CONFIG}-${TS_ENV}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-common.inc:10 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/spm-test${SP_INDEX}/${TS_ENV}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb:3 has a lack of whitespace around the assignment: 'SP_INDEX="1"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test2_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test2_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test2_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-common.inc:10 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/spm-test${SP_INDEX}/${TS_ENV}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test2_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test2_git.bb:3 has a lack of whitespace around the assignment: 'SP_INDEX="2"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test3_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test3_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test3_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-common.inc:10 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/spm-test${SP_INDEX}/${TS_ENV}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test3_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test3_git.bb:3 has a lack of whitespace around the assignment: 'SP_INDEX="3"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test4_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test4_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test4_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-common.inc:10 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/spm-test${SP_INDEX}/${TS_ENV}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test4_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-spm-test4_git.bb:3 has a lack of whitespace around the assignment: 'SP_INDEX="4"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-common.inc:42 has a lack of whitespace around the assignment: 'OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb:8 has a lack of whitespace around the assignment: 'OECMAKE_SOURCEPATH="${S}/deployments/protected-storage/config/${TS_SP_PS_CONFIG}-${TS_ENV}"'
WARNING: meta-arm/meta-arm/recipes-security/trusted-services/ts-uefi-test_git.bb: meta-arm/meta-arm/recipes-security/trusted-services/trusted-services.inc:37 has a lack of whitespace around the assignment: 'export CROSS_COMPILE="${TARGET_PREFIX}"'

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../external-arm-toolchain/arm-binary-toolchain.inc           | 2 +-
 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb  | 2 +-
 meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb  | 2 +-
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc     | 2 +-
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc     | 2 +-
 .../trusted-firmware-rmm/trusted-firmware-rmm_0.6.0.bb        | 2 +-
 meta-arm/recipes-devtools/fvp/fvp-common.inc                  | 2 +-
 meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb        | 4 ++--
 meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend      | 2 +-
 meta-arm/recipes-security/optee/optee-os-ts.inc               | 2 +-
 meta-arm/recipes-security/optee/optee.inc                     | 2 +-
 meta-arm/recipes-security/trusted-services/libts_git.bb       | 2 +-
 .../recipes-security/trusted-services/trusted-services.inc    | 2 +-
 meta-arm/recipes-security/trusted-services/ts-demo_git.bb     | 2 +-
 .../trusted-services/ts-sp-attestation_git.bb                 | 2 +-
 .../trusted-services/ts-sp-block-storage_git.bb               | 2 +-
 meta-arm/recipes-security/trusted-services/ts-sp-common.inc   | 2 +-
 .../recipes-security/trusted-services/ts-sp-crypto_git.bb     | 2 +-
 meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb   | 2 +-
 meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb   | 2 +-
 .../recipes-security/trusted-services/ts-sp-se-proxy_git.bb   | 2 +-
 .../trusted-services/ts-sp-smm-gateway_git.bb                 | 2 +-
 .../trusted-services/ts-sp-spm-test-common.inc                | 2 +-
 .../recipes-security/trusted-services/ts-sp-spm-test1_git.bb  | 2 +-
 .../recipes-security/trusted-services/ts-sp-spm-test2_git.bb  | 2 +-
 .../recipes-security/trusted-services/ts-sp-spm-test3_git.bb  | 2 +-
 .../recipes-security/trusted-services/ts-sp-spm-test4_git.bb  | 2 +-
 .../recipes-security/trusted-services/ts-sp-storage_git.bb    | 2 +-
 28 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
index 0e039a5b..c77d3393 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/arm-binary-toolchain.inc
@@ -28,4 +28,4 @@ BBCLASSEXTEND = "native nativesdk"
 # Skipping file deps - we don't control the dependencies for prebuilt libraries, resulting in
 # nothing provides libcrypt.so.1()(64bit) needed by nativesdk-gcc-arm-none-eabi 
 # when packaged as RPM for SDK.
-SKIP_FILEDEPS="1"
+SKIP_FILEDEPS = "1"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb
index 645e8d86..9e505d7a 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.10.3.bb
@@ -34,7 +34,7 @@ B = "${WORKDIR}/build"
 EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
 
 # Requires CROSS_COMPILE set by hand as there is no configure script
-export CROSS_COMPILE="${TARGET_PREFIX}"
+export CROSS_COMPILE = "${TARGET_PREFIX}"
 
 LDFLAGS[unexport] = "1"
 do_compile() {
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb
index c3f0c7fa..77c36a47 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/tf-a-tests_2.12.0.bb
@@ -35,7 +35,7 @@ B = "${WORKDIR}/build"
 EXTRA_OEMAKE += "BUILD_BASE=${B} PLAT=${TFA_PLATFORM}"
 
 # Requires CROSS_COMPILE set by hand as there is no configure script
-export CROSS_COMPILE="${TARGET_PREFIX}"
+export CROSS_COMPILE = "${TARGET_PREFIX}"
 
 LDFLAGS[unexport] = "1"
 do_compile() {
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index f90b5884..c168cdea 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -77,7 +77,7 @@ TFA_BUILD_TARGET ?= "bl1"
 TFA_INSTALL_TARGET ?= "${TFA_BUILD_TARGET}"
 
 # Requires CROSS_COMPILE set by hand as there is no configure script
-export CROSS_COMPILE="${TARGET_PREFIX}"
+export CROSS_COMPILE = "${TARGET_PREFIX}"
 
 # Let the Makefile handle setting up the CFLAGS and LDFLAGS as it is a standalone application
 CFLAGS[unexport] = "1"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index 7dbe12b2..06b9390c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -86,7 +86,7 @@ DEBUG_PREFIX_MAP:remove = "-fcanon-prefix-map"
 
 # python3-cryptography needs the legacy provider, so set OPENSSL_MODULES to the
 # right path until this is relocated automatically.
-export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"
+export OPENSSL_MODULES = "${STAGING_LIBDIR_NATIVE}/ossl-modules"
 
 do_configure[cleandirs] = "${B}"
 do_configure() {
diff --git a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.6.0.bb b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.6.0.bb
index d69b4e24..96b1bd05 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.6.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-rmm/trusted-firmware-rmm_0.6.0.bb
@@ -31,7 +31,7 @@ EXTRA_OECMAKE += "-DCMAKE_INCLUDE_PATH=${STAGING_INCDIR}"
 
 # When compiling for Aarch64 on non-native hosts, the RMM code base gets its
 # toolchain from CROSS_COMPILE rather than CMAKE_TOOLCHAIN_FILE
-export CROSS_COMPILE="${TARGET_PREFIX}"
+export CROSS_COMPILE = "${TARGET_PREFIX}"
 
 do_install() {
     install -d -m 755 ${D}/firmware
diff --git a/meta-arm/recipes-devtools/fvp/fvp-common.inc b/meta-arm/recipes-devtools/fvp/fvp-common.inc
index 477c45f4..5d87cef7 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-common.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-common.inc
@@ -39,7 +39,7 @@ def get_fm_short_pv_url(d):
 VERSION = "${@oe.utils.trim_version(d.getVar('PV', -1))}"
 BUILD = "${@d.getVar('PV').split('.')[-1]}"
 PV_URL = "${@get_real_pv(d)}"
-PV_URL_SHORT="${@get_fm_short_pv_url(d)}"
+PV_URL_SHORT = "${@get_fm_short_pv_url(d)}"
 
 # The directory the FVP is installed into
 FVPDIR = "${libdir}/fvp/${BPN}"
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
index de68d91c..1aa46f9a 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5a3925ece0806073ae9ebbb08ff6f11e"
 
 DEPENDS = "python3-pyelftools-native optee-os-tadevkit python3-cryptography-native "
 
-FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
+FTPM_UUID = "bc50d971-d4c9-42c4-82cb-343fb7f37896"
 
 SRC_URI = "gitsm://github.com/Microsoft/ms-tpm-20-ref;branch=main;protocol=https \
            file://0001-add-enum-to-ta-flags.patch"
@@ -50,7 +50,7 @@ CFLAGS += "-Wno-implicit-function-declaration -Wno-incompatible-pointer-types"
 
 # python3-cryptography needs the legacy provider, so set OPENSSL_MODULES to the
 # right path until this is relocated automatically.
-export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"
+export OPENSSL_MODULES = "${STAGING_LIBDIR_NATIVE}/ossl-modules"
 
 PARALLEL_MAKE = ""
 
diff --git a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
index 31be0e8f..92c11157 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
+++ b/meta-arm/recipes-security/optee-ftpm/optee-os_%.bbappend
@@ -1,4 +1,4 @@
-FTPM_UUID="bc50d971-d4c9-42c4-82cb-343fb7f37896"
+FTPM_UUID = "bc50d971-d4c9-42c4-82cb-343fb7f37896"
 
 DEPENDS:append = "\
     ${@bb.utils.contains('MACHINE_FEATURES', 'optee-ftpm', 'optee-ftpm', '' , d)} \
diff --git a/meta-arm/recipes-security/optee/optee-os-ts.inc b/meta-arm/recipes-security/optee/optee-os-ts.inc
index d30e8ea7..82545ccb 100644
--- a/meta-arm/recipes-security/optee/optee-os-ts.inc
+++ b/meta-arm/recipes-security/optee/optee-os-ts.inc
@@ -8,7 +8,7 @@ require recipes-security/trusted-services/ts-uuid.inc
 
 TS_ENV ?= "opteesp"
 TS_BIN = "${RECIPE_SYSROOT}/usr/${TS_ENV}/bin"
-TS_BIN_SPM_TEST= "${RECIPE_SYSROOT}/usr/opteesp/bin"
+TS_BIN_SPM_TEST = "${RECIPE_SYSROOT}/usr/opteesp/bin"
 
 SP_EXT = "${@oe.utils.conditional('TS_ENV','opteesp','.stripped.elf','.bin',d)}"
 
diff --git a/meta-arm/recipes-security/optee/optee.inc b/meta-arm/recipes-security/optee/optee.inc
index cd25d0e5..5f01570f 100644
--- a/meta-arm/recipes-security/optee/optee.inc
+++ b/meta-arm/recipes-security/optee/optee.inc
@@ -31,7 +31,7 @@ EXTRA_OEMAKE += "V=1 \
                 "
 # python3-cryptography needs the legacy provider, so set OPENSSL_MODULES to the
 # right path until this is relocated automatically.
-export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"
+export OPENSSL_MODULES = "${STAGING_LIBDIR_NATIVE}/ossl-modules"
 
 CFLAGS += "--sysroot=${STAGING_DIR_HOST}"
 
diff --git a/meta-arm/recipes-security/trusted-services/libts_git.bb b/meta-arm/recipes-security/trusted-services/libts_git.bb
index 635e4769..a805c0a0 100644
--- a/meta-arm/recipes-security/trusted-services/libts_git.bb
+++ b/meta-arm/recipes-security/trusted-services/libts_git.bb
@@ -9,7 +9,7 @@ SRC_URI += "file://tee-udev.rules \
             file://0001-Remove-TEE-driver-external-component.patch \
            "
 
-OECMAKE_SOURCEPATH="${S}/deployments/libts/${TS_ENV}"
+OECMAKE_SOURCEPATH = "${S}/deployments/libts/${TS_ENV}"
 
 DEPENDS           += "arm-ffa-user"
 
diff --git a/meta-arm/recipes-security/trusted-services/trusted-services.inc b/meta-arm/recipes-security/trusted-services/trusted-services.inc
index 272e9106..17064f74 100644
--- a/meta-arm/recipes-security/trusted-services/trusted-services.inc
+++ b/meta-arm/recipes-security/trusted-services/trusted-services.inc
@@ -34,7 +34,7 @@ EXTRA_OECMAKE += '-DLIBGCC_LOCATE_CFLAGS="--sysroot=${STAGING_DIR_HOST}" \
                   -DCROSS_COMPILE="${TARGET_PREFIX}" \
                   -DTS_PLATFORM="${TS_PLATFORM}" \
                  '
-export CROSS_COMPILE="${TARGET_PREFIX}"
+export CROSS_COMPILE = "${TARGET_PREFIX}"
 
 # Default TS installation path
 TS_INSTALL = "/usr/${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-demo_git.bb b/meta-arm/recipes-security/trusted-services/ts-demo_git.bb
index a17c1720..ddd3764e 100644
--- a/meta-arm/recipes-security/trusted-services/ts-demo_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-demo_git.bb
@@ -10,7 +10,7 @@ DEPENDS        += "python3-jsonschema-native python3-jinja2-native"
 DEPENDS        += "libts"
 RDEPENDS:${PN} += "libts"
 
-OECMAKE_SOURCEPATH="${S}/deployments/ts-demo/${TS_ENV}"
+OECMAKE_SOURCEPATH = "${S}/deployments/ts-demo/${TS_ENV}"
 
 # Mbedtls 3.1.0 does not compile with clang.
 # This can be removed after TS updated required mbedtls version
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb
index 6cddfb03..5aecddeb 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-attestation_git.bb
@@ -5,4 +5,4 @@ require ts-sp-common.inc
 SP_UUID = "${ATTESTATION_UUID}"
 TS_SP_IAT_CONFIG ?= "default"
 
-OECMAKE_SOURCEPATH="${S}/deployments/attestation/config/${TS_SP_IAT_CONFIG}-${TS_ENV}"
+OECMAKE_SOURCEPATH = "${S}/deployments/attestation/config/${TS_SP_IAT_CONFIG}-${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-block-storage_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-block-storage_git.bb
index efbaad14..53895876 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-block-storage_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-block-storage_git.bb
@@ -10,4 +10,4 @@ require ts-sp-common.inc
 SP_UUID = "${BLOCK_STORAGE_UUID}"
 TS_SP_BLOCK_STORAGE_CONFIG ?= "default"
 
-OECMAKE_SOURCEPATH="${S}/deployments/block-storage/config/${TS_SP_BLOCK_STORAGE_CONFIG}-${TS_ENV}"
+OECMAKE_SOURCEPATH = "${S}/deployments/block-storage/config/${TS_SP_BLOCK_STORAGE_CONFIG}-${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
index c8b1409c..83cac6ea 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-common.inc
@@ -39,5 +39,5 @@ OECMAKE_CXX_FLAGS:remove = "-D_FORTIFY_SOURCE=2"
 
 # Override yoctos default linux specific toolchain file. trusted-services.inc
 # will add a proper tooclhain option.
-OECMAKE_ARGS:remove="-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"
+OECMAKE_ARGS:remove = "-DCMAKE_TOOLCHAIN_FILE:FILEPATH=${WORKDIR}/toolchain.cmake"
 
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb
index 867e4a81..2ed812b5 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-crypto_git.bb
@@ -7,4 +7,4 @@ TS_SP_CRYPTO_CONFIG ?= "default"
 
 DEPENDS += "python3-protobuf-native python3-jsonschema-native python3-jinja2-native"
 
-OECMAKE_SOURCEPATH="${S}/deployments/crypto/config/${TS_SP_CRYPTO_CONFIG}-${TS_ENV}"
+OECMAKE_SOURCEPATH = "${S}/deployments/crypto/config/${TS_SP_CRYPTO_CONFIG}-${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb
index 9fdb8044..247f3359 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-fwu_git.bb
@@ -11,7 +11,7 @@ inherit deploy
 SP_UUID = "${FWU_UUID}"
 TS_SP_FWU_CONFIG ?= "default"
 
-OECMAKE_SOURCEPATH="${S}/deployments/fwu/config/${TS_SP_FWU_CONFIG}-${TS_ENV}"
+OECMAKE_SOURCEPATH = "${S}/deployments/fwu/config/${TS_SP_FWU_CONFIG}-${TS_ENV}"
 
 # The GPT parser component is needed from TF-A
 SRC_URI += "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;name=tfa;protocol=https;branch=master;destsuffix=git/tf-a"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb
index 5472dbda..987cd7a9 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-its_git.bb
@@ -5,4 +5,4 @@ require ts-sp-common.inc
 SP_UUID = "${ITS_UUID}"
 TS_SP_ITS_CONFIG ?= "default"
 
-OECMAKE_SOURCEPATH="${S}/deployments/internal-trusted-storage/config/${TS_SP_ITS_CONFIG}-${TS_ENV}"
+OECMAKE_SOURCEPATH = "${S}/deployments/internal-trusted-storage/config/${TS_SP_ITS_CONFIG}-${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb
index 26781434..5ce593cb 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-se-proxy_git.bb
@@ -7,4 +7,4 @@ TS_SP_SE_PROXY_CONFIG ?= "default"
 
 DEPENDS += "python3-protobuf-native"
 
-OECMAKE_SOURCEPATH="${S}/deployments/se-proxy/config/${TS_SP_SE_PROXY_CONFIG}-${TS_ENV}"
+OECMAKE_SOURCEPATH = "${S}/deployments/se-proxy/config/${TS_SP_SE_PROXY_CONFIG}-${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb
index 752f7fe7..d72e8946 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-smm-gateway_git.bb
@@ -5,4 +5,4 @@ require ts-sp-common.inc
 SP_UUID = "${SMM_GATEWAY_UUID}"
 TS_SP_SMM_GATEWAY_CONFIG ?= "default"
 
-OECMAKE_SOURCEPATH="${S}/deployments/smm-gateway/config/${TS_SP_SMM_GATEWAY_CONFIG}-${TS_ENV}"
+OECMAKE_SOURCEPATH = "${S}/deployments/smm-gateway/config/${TS_SP_SMM_GATEWAY_CONFIG}-${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-common.inc b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-common.inc
index 5c0d6865..6de68562 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-common.inc
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test-common.inc
@@ -7,4 +7,4 @@ require ts-sp-common.inc
 
 SP_UUID = "${SPM_TEST${SP_INDEX}_UUID}"
 SP_DTS_FILE ?= "${D}${TS_INSTALL}/manifest/${SP_UUID}.dts"
-OECMAKE_SOURCEPATH="${S}/deployments/spm-test${SP_INDEX}/${TS_ENV}"
+OECMAKE_SOURCEPATH = "${S}/deployments/spm-test${SP_INDEX}/${TS_ENV}"
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb
index 4cbb970b..2ef244df 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test1_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Trusted Services SPMC test SP1"
 
-SP_INDEX="1"
+SP_INDEX = "1"
 
 require ts-sp-spm-test-common.inc
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-spm-test2_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test2_git.bb
index e6fb822b..f2578da4 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-spm-test2_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test2_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Trusted Services SPMC test SP2"
 
-SP_INDEX="2"
+SP_INDEX = "2"
 
 require ts-sp-spm-test-common.inc
 
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-spm-test3_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test3_git.bb
index ad3ee76e..267a4188 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-spm-test3_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test3_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Trusted Services SPMC test SP3"
 
-SP_INDEX="3"
+SP_INDEX = "3"
 
 require ts-sp-spm-test-common.inc
 
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-spm-test4_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test4_git.bb
index 2ee69c1f..7fffb073 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-spm-test4_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-spm-test4_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Trusted Services SPMC test SP4"
 
-SP_INDEX="4"
+SP_INDEX = "4"
 
 require ts-sp-spm-test-common.inc
 
diff --git a/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb b/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb
index 5b2f47b3..5d753e76 100644
--- a/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb
+++ b/meta-arm/recipes-security/trusted-services/ts-sp-storage_git.bb
@@ -5,4 +5,4 @@ require ts-sp-common.inc
 SP_UUID = "${STORAGE_UUID}"
 TS_SP_PS_CONFIG ?= "default"
 
-OECMAKE_SOURCEPATH="${S}/deployments/protected-storage/config/${TS_SP_PS_CONFIG}-${TS_ENV}"
+OECMAKE_SOURCEPATH = "${S}/deployments/protected-storage/config/${TS_SP_PS_CONFIG}-${TS_ENV}"

