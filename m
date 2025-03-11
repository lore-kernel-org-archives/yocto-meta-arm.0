Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE91EC282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 10:30:19 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.5475.1741689011043100787
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 03:30:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=jnNqLtcI;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54991d85f99so4240754e87.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 11 Mar 2025 03:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741689009; x=1742293809; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPPnCvQ0FGDJ307JoBWbXnycW7YKnxTAil4cywgOjx0=;
        b=jnNqLtcIHWUIiQ1UDm7xlLrIvXuJg7rYcJTpnzYqZPzGCUihMhhJJ3CQB9nuHyXQzJ
         coWhr8qYcFCXxVstK9RwqNwQrFiIgmwgbbbkH/Cg4z9V1xG0NkKrNkZ3s0E0VNkVv9Ol
         9TqkrSTsITL47mXKw4jtRVAuD6BqQDze8XCFrp/Nqdx7RE5UJ3/OJc9612qWz+7HefSp
         EZmWH1p9ol94CdgqXNwHXBz1VyRTnqk2b3TpsJsAISFKoThQw5j3pJbBcmElfgW1pmE6
         r0ZcZYcXP0+CrCL6EYrZ2UD7kE2rz4PcHHSZWWO+++QoWrKxHDLpKv+NcpYNknj5tld/
         CGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741689009; x=1742293809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FPPnCvQ0FGDJ307JoBWbXnycW7YKnxTAil4cywgOjx0=;
        b=Cy5SIb1QltBcegrqxzLlpt+jMrVxf82jJxALC5ox1j9knPuNscb/UHJKE0YuyZmjZM
         KbPRGFiCtB2nI6AEKwuwXlaBFO/yqllLQCgh8AxnXTqPgMjeNDECz+gwohoue3e+3I4j
         Lh1k1QkQGhyOEhT2mhBfw1PXyN/ca7lUFE8MLmWtM7MLItqm4oCT3UbcfBwJ0d3k3Pnh
         SoWli0lZ1uFJlh+97i9YZKqonB6tQVGcq6xCaKyrzbXqOEgkhkAdqH2cuadCdlzeWJ7r
         IOyhClTFExtpMcnuVqMgmJZIQEbVdQrQUqxXEP4ZIKRrnAMTkT62Ds2+GIpxVnEVKzdb
         3+Aw==
X-Gm-Message-State: AOJu0YxDTIONVE42Si4giXjE+9serm6exQ6DP1TAz44dyGti69Jvgtvx
	8msbiBLz8sc5MCBFuAGhPHWo13sqHolmNbTcHg0TEYYdpwJIFo8jmJ+6AbY141LM9SCUCP8sBPw
	QJe0=
X-Gm-Gg: ASbGnctIU9hWrPgp77lWjaBS8TnwcQiuaIHxQrr24l5LmqHR2zM1ubZWZ1mGkmkTqtU
	ZJVk21Ip9t92Ppj0VH81T6AaisAwUsAF1TBiY8N51Nz8/6JGnGXCyZ65v6ViV+qh1xpCBviLRFY
	aKRngWSfAMxDyw9ybGeV2JTnOVozUKyFFCiNUgCjQQ0vouZszuR2Sx3jaQ6qS7zH+6MVAhB++m2
	NWOMUJjEbVgNAcUDcCMgjb9NCi27q4cXj1ZJdkxE4nRD4vYxDtqXOFdNtXwPPYNuwdmiPfD0htf
	YwQ6NbLzumQAHJFYVyBcq5hWUY4yEaH+vyCCkk6Rs1+19HKIqv/OpBjsd2mYqy6xvl63sWw3EDi
	OP2MyONZ0FVXXSw==
X-Google-Smtp-Source: AGHT+IExKmjYYiEvTp9C1b0MOhGWg/HCOyT1V+YVKdMEspclkXHc9cFlCoo5ASqI5g1pVs1dT/JLvA==
X-Received: by 2002:a05:6512:b1d:b0:545:6a2:e59 with SMTP id 2adb3069b0e04-549abd30efdmr1133710e87.18.1741689008856;
        Tue, 11 Mar 2025 03:30:08 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd5b5sm1734685e87.158.2025.03.11.03.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 03:30:07 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: ilias.apalodimas@linaro.org,
	javier.tia@linaro.org,
	Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 2/2] optee-ftpm: support genericarm64
Date: Tue, 11 Mar 2025 12:29:34 +0200
Message-ID: <20250311102934.63753-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250311102934.63753-1-mikko.rapeli@linaro.org>
References: <20250311102934.63753-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Mar 2025 10:30:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6402

genericarm64 machines may have firmware with optee support
and thus also optee-ftpm may be compiled and used there.
tee-supplicant will load TAs at runtime if support is
detected.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
index 9546215a..de68d91c 100644
--- a/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
+++ b/meta-arm/recipes-security/optee-ftpm/optee-ftpm_git.bb
@@ -3,6 +3,7 @@ DESCRIPTION = "TCG reference implementation of the TPM 2.0 Specification."
 HOMEPAGE = "https://github.com/microsoft/ms-tpm-20-ref/"
 
 COMPATIBLE_MACHINE ?= "invalid"
+COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
 COMPATIBLE_MACHINE:qemuarm64 = "qemuarm64"
 COMPATIBLE_MACHINE:qemuarm64-secureboot = "qemuarm64"
 COMPATIBLE_MACHINE:qemuarm-secureboot = "qemuarm"
-- 
2.43.0


