Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.11601.1592316849163792266
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Jun 2020 07:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=nKsTz+fc;
 spf=pass (domain: burtonini.com, ip: 209.85.128.65, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f65.google.com with SMTP id d128so3260354wmc.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 16 Jun 2020 07:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dUfryhpsMBW3/f03b3Z10L/zCPyyCyjOf5jy5mTeuko=;
        b=nKsTz+fcvsb3gJtvM0FB9Mw+Z5Gcph7stUHpdSMnRYjzCoj7leNie7gAOVFApJCo3Y
         TudI//Ux0emf1+B9+dcFZbKcqTCldmb3JsJFe5clqtNE064AxJpjKR8A0630LSf8OUu4
         aY6vbuHJ07htGvgozeAvogyNs7PPD3j73Z/5vlhJOZuDWcYaDZY7WK6oc4tMITDF9VsR
         uo6tTUb0m2G+DplYrB7xJJYzgBL+5Xnrx/nFVoYBRjtRZ4o7JI5fYGwWmqdCX28DTQWJ
         WbFpc8NV7yBUdNkaPIA7aq1AgXh+noNA4Kwb+jZ8te9usMhg/0TmKC1esCjWHs85nGZp
         VCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dUfryhpsMBW3/f03b3Z10L/zCPyyCyjOf5jy5mTeuko=;
        b=jwFhFhK4HVv37MgNsFfhMnxfY6prpNXgRYT+gYea62MI6jixdFNrhDZ/DqbdsGF6HU
         EotUoChyQVuUe5xSmrNk4S3XrPJNE4QUYRyHfwKnFj0g3BmPRrsh0rdpRU4N2VoJNK+G
         IcBmMlGf4GCXFW7yo/cFCRqYNkHCP1hvWpfRTwom++hkGh1o2jciHB8y+u3AVIYbz7xW
         1EEA4NX2T0w1ArmRhpi/EevOnlC9GM2CcELHXi0LIHEodsP1IqbmTCqlrdbB5cgu0Jqd
         9lYZQnkNBTzZJ0qLkOC7240BW5rFg5d8M+rmgedDRrrevNofdMyZ+Mnnw1HMeq/WKuq5
         ScTA==
X-Gm-Message-State: AOAM532Nkz8LMFNGcESDbANfUwc5zz8KgFy0zzmOUphrq+muWR2y3mPX
	3DdfOtKY/kVGIfPpuxgAseUd50vU6m5F+g==
X-Google-Smtp-Source: ABdhPJyo3JwfEpJJe4eN59+7n4j/bAS3/a/CUd3AQVVCZ0DAfhbdj0nJFBnG2oYBwmSe2yl8z0L6IA==
X-Received: by 2002:a1c:c908:: with SMTP id f8mr3490940wmb.150.1592316847410;
        Tue, 16 Jun 2020 07:14:07 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id 104sm31057376wrl.25.2020.06.16.07.14.06
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 07:14:06 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] README: add Ross Burton as co-maintainer
Date: Tue, 16 Jun 2020 15:14:02 +0100
Message-Id: <20200616141404.1046832-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 README.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/README.md b/README.md
index 04c641d..8f56fce 100644
--- a/README.md
+++ b/README.md
@@ -36,3 +36,4 @@ to reproduce the issue
 Maintainer(s)
 -------------
 * Jon Mason <jon.mason@arm.com>
+* Ross Burton <ross.burton@arm.com>
-- 
2.26.2

