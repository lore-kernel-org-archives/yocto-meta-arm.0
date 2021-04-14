Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.13264.1618408084254146885
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 14 Apr 2021 06:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=Sy54FQ7H;
 spf=pass (domain: blade-group.com, ip: 209.85.128.48, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wm1-f48.google.com with SMTP id w7-20020a1cdf070000b0290125f388fb34so10183173wmg.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 14 Apr 2021 06:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jk6eK3DAHsakLCU8TPK0xB/KeJS7pxTk34JZ4uGfzR8=;
        b=Sy54FQ7HqbriNtuFsZS5L5B4B3mm88jNJ05AzocGRT2Ab90JOkyHmvQLgnk3DK0PTp
         ms+U/pYKWCmsgCAePsxHBxuWAqvhZFPNqOa6VsH/RMVIl8zjXnb8Z6NsQm8MOdTNwGlM
         15l2kJI7y/uf8ZFSRIA2SqewIeZ8MEDfMxnhrydVNnV91d3FCY9Lr28pQntmiHP1rjKC
         Q67bngcGSdof1nMXlbxg+nGnAirmUupCi3vvDXEecOo5sD5A19RJveo7KoM+5jvyQpZ2
         mbNiUGacQFFd+Dw5F/HOFjQAScZ7A7yj3ER0l20NJ4Ovck3k0cxoUj3yDM0JGz497Oct
         LDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jk6eK3DAHsakLCU8TPK0xB/KeJS7pxTk34JZ4uGfzR8=;
        b=lHGKRb+fKRcGKgWXCTr3CBQ9Nbzd4hMN9qoKE4ORXGK5zps0OplAUf9UQ2KUzpqjlz
         Gc34tGhSMby+gLx+cljFCt9wV2QJuirrJYibrvZgmhMiwyxNc2UbM5l+pEVtKtH4v3UD
         mkU+UKUIcdv5F0WQaJp/dF4VYY75hUwopfuiwy21XPFwnMhLn6MXfn80H+GF9esI5cz5
         m8HHNuQjWWFmjPbL6C3RzwQu9HRMKRZdlHP4kgG0dS11JiZZoBTXUiCYW8b3nbNUe1Rp
         6rtigVRVT+/9SDt3fuIoR1s9OlQK2n+dipgMYnqPFGOGV5XMtByfORmwd0kk2TFzbnOy
         NlFA==
X-Gm-Message-State: AOAM530CLE2Ag/LJcJ23QySDb3qEX2BFVK//r63zP6qKnzI6peP0+Ebn
	+y6pU/4nsaOU4qbxX7y+tDzQcCvgm3c/4Q==
X-Google-Smtp-Source: ABdhPJxE+dvbBwrtV2nPjBcSr1Yx4GEXgjGkMdll47RmIC4CE3Iyw5Rsh5ZuKfK7DKdhEj3OQzVgTQ==
X-Received: by 2002:a7b:c4d9:: with SMTP id g25mr3200714wmk.182.1618408082928;
        Wed, 14 Apr 2021 06:48:02 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id q20sm5517551wmq.2.2021.04.14.06.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 06:48:02 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: meta-arm@lists.yoctoproject.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH v2 5/6] optee-os: don't override upstream TA_LOG_LEVEL setting
Date: Wed, 14 Apr 2021 15:47:25 +0200
Message-Id: <20210414134726.4125294-6-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210414134726.4125294-1-yann@blade-group.com>
References: <20210414134726.4125294-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Aside from diverging from upstream, appending such a change it at the end of
oe_runmake makes it hard to override it in a bbappend.

This value does not seem to be inherited in TA builds, and
eg. optee-examples do use the the values set in their individual
Makefiles.  Setting this to 0 however seems to cause the TA traces not
to be relayed to the console, so the examples end up less
self-illustrative than they should.

This patch restores the upstream choice, while allowing downstream layers to
choose to set it to zero if they wish to do so.

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta-arm/recipes-security/optee/optee-os.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-security/optee/optee-os.inc b/meta-arm/recipes-security/optee/optee-os.inc
index 08cc2f0..ca6e01b 100644
--- a/meta-arm/recipes-security/optee/optee-os.inc
+++ b/meta-arm/recipes-security/optee/optee-os.inc
@@ -38,7 +38,7 @@ LD[unexport] = "1"
 do_configure[noexec] = "1"
 
 do_compile() {
-    oe_runmake -C ${S} all CFG_TEE_TA_LOG_LEVEL=0
+    oe_runmake -C ${S} all
 }
 do_compile[cleandirs] = "${B}"
 
-- 
2.30.2

