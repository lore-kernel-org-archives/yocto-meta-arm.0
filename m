Return-Path: <javier.tia@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A933C5321D
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 19:04:54 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.1084.1724094291365266873
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 19 Aug 2024 12:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=cL2UmSJ+;
 spf=pass (domain: linaro.org, ip: 209.85.219.48, mailfrom: javier.tia@linaro.org)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6bf9db9740aso6859116d6.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 12:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724094290; x=1724699090; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pdnG999dm3rF+hIEfVOM/gZrmTIZsPMZ3v3wSlgIkX0=;
        b=cL2UmSJ+tbtiwb9KFyuPttG+H40EL55ZiwzEpon3m7DSrlGfGlmDTJyCiClY81BOW9
         S6X2O4C9TJEQiUo89muz/Ih9s4NLR5g5rEQ+0cffNB62QfbDoBF2CH3c+syUKa6Rbxgb
         xODA8UQg40OxJTbxfmRrHPLYw2pzY/CeZ8WS+lkb/0IbETc8MZAla8guzhYLlqDPN8fi
         oz0TsbYvxHqJb/vrOePEtpkfuRjAdQmnicalBI42Z2bQWVc6gGWdgsj9qjS5TBwagjlq
         upkhf8+L+YzosW09HLlys20yDqpkcY5QDI55zSKK2+ImfwMn8NLFZ0xxgcmii7udDWhy
         Hiuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724094290; x=1724699090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pdnG999dm3rF+hIEfVOM/gZrmTIZsPMZ3v3wSlgIkX0=;
        b=OUtoPm9M5cRqV0ZJ53C/uvwbcQZs5ANOaGPpA0T9X9I1qg0SIYYrrJDHTPPiCCyWza
         vUuTEGgyScH6jIcvllpC6940LM5IW0E0IaqpMovOIegqaTpXHx2+96qSZjdg55jqQzIV
         jdlkgnWSc+pKqA4DbHU6ERtF9Zd56Uu88cpMyTnDp7Xw6RI4D9rxoavFeI/RWuSvGuqm
         vZwbkx+rYN/qgpS3avyiEslQlvxjfln0KaIzHYLsCbO8y1LIIr5NxO1ZJVuciMNEMHVu
         56YL6MOAb5P03nbijT1jhAuxgf6ahZg/tQeipQvI9LlcdL/bm3Nw/UXADlJzfvL90H5J
         ZZ3A==
X-Gm-Message-State: AOJu0YyOlPNQ88hzw/l7RIrAtCvaiNk4qOz19lX54GeJ9r+sDRsx8YbL
	wUZTz/aDDXl6GCPv/TOWxb2dVxTB6Sm6Z+lZ2gUkf5IF0yb5SF9rxCtE1EO6OGNt2e/3uv7rqac
	h
X-Google-Smtp-Source: AGHT+IF0qYBgf2WQnHKvp4zWplRoi8vqOpbzqe276m3GTzzesVuPj+deEUGltuqdod5TpAXteLzeFA==
X-Received: by 2002:a05:6214:3f85:b0:6bf:6bf3:9611 with SMTP id 6a1803df08f44-6bf7ce5f35cmr162091886d6.38.1724094290307;
        Mon, 19 Aug 2024 12:04:50 -0700 (PDT)
Received: from jetm-rog-x670e-gene.lan ([177.93.4.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fe06feasm45371756d6.40.2024.08.19.12.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 12:04:49 -0700 (PDT)
From: Javier Tia <javier.tia@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>,
	Javier Tia <javier.tia@linaro.org>
Subject: [PATCH v2 14/14] qemuarm64-secureboot.yml: Set branch to scarthgap
Date: Mon, 19 Aug 2024 13:04:29 -0600
Message-ID: <20240819190429.2897888-15-javier.tia@linaro.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819190429.2897888-1-javier.tia@linaro.org>
References: <20240819190429.2897888-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 19 Aug 2024 19:04:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5980

UEFI Secure Boot is broken in master. Set to the latest stable OE
branch.

Signed-off-by: Javier Tia <javier.tia@linaro.org>
---
 ci/qemuarm64-secureboot.yml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ci/qemuarm64-secureboot.yml b/ci/qemuarm64-secureboot.yml
index 02341934..cadbe874 100644
--- a/ci/qemuarm64-secureboot.yml
+++ b/ci/qemuarm64-secureboot.yml
@@ -1,5 +1,9 @@
 # yaml-language-server: $schema=https://raw.githubusercontent.com/siemens/kas/master/kas/schema-kas.json
 
+defaults:
+ repos:
+    branch: scarthgap
+
 header:
   version: 14
   includes:
-- 
2.46.0


