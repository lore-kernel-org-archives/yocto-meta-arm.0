Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663BDC54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 18:30:06 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.52922.1710786605258637587
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 18 Mar 2024 11:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=yWdiNnOY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-789ddcd57f4so282176185a.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 11:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710786604; x=1711391404; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S3HjP6tgXqeh30WbKBZ+HwvkFsD/nWwyFSswuC7nZWc=;
        b=yWdiNnOY7MRTy+EYDODI2PGWKODiYcSPaQAy7yIZQo/V1XulHR5UGLC47tbAwYxnm3
         ktNTLQ6ueIBzdTPgI3PAr/QMTs6fKxNoU/DjHh1i7bcd4F1fV59Mae/TGCnP1jhe1YH6
         YYdY60iCKEdnjaki5MatbZv6KOsSPaXMiFijtE0PzQ0ISYOSmNcVVOyrLau6VsvuxmeZ
         h4xZofyiyDa3jmrjYN+79kSAkMFNnKVy3ZVVItg6Fga+AC5DzL7GKe76nfkyLT9rHLla
         haJItjaIF0omy/Y3H75BIjdOdmA2ofVGUUoPLNfOeT7557l4ZYtzcJS+OToPbJHUkvtT
         hO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710786604; x=1711391404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3HjP6tgXqeh30WbKBZ+HwvkFsD/nWwyFSswuC7nZWc=;
        b=enW4cowmvxoZvrsHNEqIUmWwGYpR053q6Ro+J2mxlmIxmvZCAGbrYRk0SdNX8Y05D/
         T3UEF0sbcgRz4hB2NSdgmXc0D5J2WMBry+gEODK9QuqF7kOddlPC2HPz8+oUv7KLFAZ4
         iV9tw2K3QoYn0la9lYnCxj7v6p+EYGweDXJYSRWZ0uRVRPNWn/vihhh9Ya2gdubrhJvF
         SdYmoHgK3DL+xYt4v8thozhxhlH1TjhPOPfhjCTn9RbQKfxBg6arsYg9cMN9BjomSuMK
         M/QR19QOIbgEYPP8HAe7KB6uRV5OAPEHxZ9YD9wIt8CB49VPc22lwfLxo0qZ8Mt6vZOo
         hMww==
X-Gm-Message-State: AOJu0Ywc94I7xY1fcYEST6G1l2il2Y0lE2KHLRle6+dY1kt9Y6dfmo0b
	GezXmPLQYpyOZ76yaDTigXECsoNSVDKYYjhuHPVR+o+7Y/PTKnrHF9eQ2HtM3k4eRKCI80E1Rxo
	=
X-Google-Smtp-Source: AGHT+IF5DuR+xgrd0/4o+/drjQpCKo9OenYvW160Ncr9TM0BrA+1qi/N7I4R7LGFBW2UEvhTO55IFA==
X-Received: by 2002:a05:620a:c45:b0:789:f333:d0da with SMTP id u5-20020a05620a0c4500b00789f333d0damr7671644qki.20.1710786604141;
        Mon, 18 Mar 2024 11:30:04 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id z7-20020ae9c107000000b00789e1c94cf4sm3874869qki.113.2024.03.18.11.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 11:30:03 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ali.oezaslan@arm.com
Subject: Re: [PATCH 0/3] arm-bsp/trusted-firmware-m:corstone1000: update to 2.0
Date: Mon, 18 Mar 2024 14:25:31 -0400
Message-Id: <171078633825.3024366.8179804396643460340.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240313201325.27043-1-ali.oezaslan@arm.com>
References: <20240313201325.27043-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 18 Mar 2024 18:30:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5449


On Wed, 13 Mar 2024 20:13:22 +0000, ali.oezaslan@arm.com wrote:
> From: Ali Can Ozaslan <ali.oezaslan@arm.com>
> 
> This change upgrades the trusted-firmware-m version to 2.0
> for Corstone-1000. Due to the changes in TF-M 2.0,
> psa services requires a seperate client_id.
> GNU Arm compiler version is bumped in tusted-firmware-m.
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/trusted-firmware-m: corstone1000: update to 2.0
      commit: a8f47e9504a8319c635f0585d75df1737266c81b
[2/3] arm-bsp/trusted-services: corstone1000: Client Id adjustments after TF-M 2.0
      commit: de57703654dc082fc75beac4060b941823619334
[3/3] arm/trusted-firmware-m: Change GNU Arm compiler version for TF-M 2.0
      commit: ab6e5f47889803d4f8bd05bfe71fa20e0b7cd208

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

