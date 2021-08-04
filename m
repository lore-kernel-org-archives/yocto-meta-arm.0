Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web09.11720.1628095308375337787
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 09:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=f2ktroA6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id dk2so1399929qvb.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 04 Aug 2021 09:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5oqzKXhvNoXgYN/OuZvcq0HGSaaAGj+rKF9MYvjVmP8=;
        b=f2ktroA6iurbwwjifienwOZXTVYzyYUeXNArbzJiqh9k+9SFCf9EGqSK5JI4y489A1
         lF3vUVQruMqQKzh896u+BoikAYDLyzx2AQQlEwBgFpQcad+mKtdaRFkuZnCYYUJ6lN5V
         u0ymUttfhyBc6HIXtqbag1CL4eTfMwBY4CElrluiqMFYmvoHyxUK0PY3slSn1IRMbNrl
         ne54T/WtfzRXOmX/ee5b4rvbcOXp4z+63kvOkBZTK3JgGT7HqnuK/27j4YtZ6bHIfJ3X
         SEIHCLg7ugqthZzWo3d8BjUYUhfGPeS0NgmiQfj3UCm6AHHL2UoHIeKSP97ydj8rPDpu
         +2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5oqzKXhvNoXgYN/OuZvcq0HGSaaAGj+rKF9MYvjVmP8=;
        b=cyuRNcpp5lm/gRApdz+Isb3KbrmEmo9aeIlmUPDCD8Yj6QPWTSibbRyzgi1XgNMD3j
         DOy9xh7rHlvoLdQePboE883/wPsK4WTT2UUoaFDHaP8oF2gTE81Z47K1yus5uNyKCtM9
         EIHbIIvvWsQqtudjki7fekCqQWK7HnUeZ8L+Om3bbySSnwb2xKRzx8e3R/VJn6Fh2PnB
         ECMrhkgiROvfSbyrbCoID8S9gGD64Rz8El7Rh7eiwYoG3jDKp/3zZRRruGfTNGdJxpZf
         pgr92QpDetVdsr8uO2QU+8iAEldnDcixSdxtH4EgJeMNH0chDwCInynBbjuoPak73dqg
         8Qbw==
X-Gm-Message-State: AOAM531BaKKnwgOsMBWVbWDg4ZHumKBAiE9XQO53Sbdn7P37ngGLRUCl
	vF6vMwtuSSl9IZ1v0oOxhTzbuR3AH5wfsg==
X-Google-Smtp-Source: ABdhPJwAMeEyaBC/vNdCeGaUxQ8De7o8j2cNEjHg0K6BNh+w+HT11r7D9vGxl6qjXJUz2ETeGhzNJA==
X-Received: by 2002:a05:6214:1d0a:: with SMTP id e10mr392875qvd.15.1628095307467;
        Wed, 04 Aug 2021 09:41:47 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:5502:1c1f:b765:ad72])
        by smtp.gmail.com with ESMTPSA id 14sm1013879qtp.19.2021.08.04.09.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 09:41:47 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Denys Dmytriyenko <denis@denix.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH 1/3] meta-arm: Add honister layer compatibility
Date: Wed,  4 Aug 2021 12:41:43 -0400
Message-Id: <20210804164145.1556-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210804164145.1556-1-jon.mason@arm.com>
References: <20210804164145.1556-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-autonomy/conf/layer.conf | 2 +-
 meta-arm-bsp/conf/layer.conf      | 2 +-
 meta-arm/conf/layer.conf          | 2 +-
 meta-atp/conf/layer.conf          | 2 +-
 meta-gem5/conf/layer.conf         | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-arm-autonomy/conf/layer.conf b/meta-arm-autonomy/conf/layer.conf
index 98db8f867ba9..e475756a7489 100644
--- a/meta-arm-autonomy/conf/layer.conf
+++ b/meta-arm-autonomy/conf/layer.conf
@@ -17,7 +17,7 @@ LAYERDEPENDS_meta-arm-autonomy = " \
    networking-layer \
    virtualization-layer \
 "
-LAYERSERIES_COMPAT_meta-arm-autonomy = "hardknott"
+LAYERSERIES_COMPAT_meta-arm-autonomy = "hardknott honister"
 
 # We don't activate virtualization feature from meta-virtualization as it
 # brings in lots of stuff we don't need. We need to disable the sanity check
diff --git a/meta-arm-bsp/conf/layer.conf b/meta-arm-bsp/conf/layer.conf
index 665f914b6e5a..40905ad8253f 100644
--- a/meta-arm-bsp/conf/layer.conf
+++ b/meta-arm-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-arm-bsp"
 BBFILE_PATTERN_meta-arm-bsp = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-arm-bsp = "5"
 
-LAYERSERIES_COMPAT_meta-arm-bsp = "hardknott"
+LAYERSERIES_COMPAT_meta-arm-bsp = "hardknott honister"
 
 LAYERDEPENDS_meta-arm-bsp = "core meta-arm"
 # This won't be used by layerindex-fetch, but works everywhere else
diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 9ee87493f4b1..4c3b58efbfce 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -13,4 +13,4 @@ LAYERDEPENDS_meta-arm = " \
     core \
     arm-toolchain \
 "
-LAYERSERIES_COMPAT_meta-arm = "hardknott"
+LAYERSERIES_COMPAT_meta-arm = "hardknott honister"
diff --git a/meta-atp/conf/layer.conf b/meta-atp/conf/layer.conf
index 3c03a623a5fa..40c46c5adf14 100644
--- a/meta-atp/conf/layer.conf
+++ b/meta-atp/conf/layer.conf
@@ -6,4 +6,4 @@ BBFILE_COLLECTIONS += "meta-atp"
 BBFILE_PATTERN_meta-atp = "^${LAYERDIR}/"
 
 LAYERDEPENDS_meta-atp = "core openembedded-layer meta-gem5"
-LAYERSERIES_COMPAT_meta-atp = "gatesgarth hardknott"
+LAYERSERIES_COMPAT_meta-atp = "gatesgarth hardknott honister"
diff --git a/meta-gem5/conf/layer.conf b/meta-gem5/conf/layer.conf
index e6320efe2642..7c7a52acfe47 100644
--- a/meta-gem5/conf/layer.conf
+++ b/meta-gem5/conf/layer.conf
@@ -10,7 +10,7 @@ BBFILE_PATTERN_meta-gem5 = "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-gem5 = "5"
 
 LAYERDEPENDS_meta-gem5 = "core openembedded-layer meta-arm"
-LAYERSERIES_COMPAT_meta-gem5 = "hardknott"
+LAYERSERIES_COMPAT_meta-gem5 = "hardknott honister"
 
 BBFILES_DYNAMIC += " \
     virtualization-layer:${LAYERDIR}/dynamic-layers/meta-virtualization/*/*/*.bbappend \
-- 
2.20.1

