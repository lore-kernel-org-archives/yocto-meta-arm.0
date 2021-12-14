Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F88C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 04:36:34 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.22193.1639456592734007255
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 20:36:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=4GE97eHn;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id de30so15898875qkb.0
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 20:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UY9Yh5+RcrGMBGxz+TPC3zkoWx+8xh4wJ/vqKtGMJ2Q=;
        b=4GE97eHnFluC9dmtbvS5ASBH+rbRbh7BuXl3UvKRGn0callsJcm3hGH6ONo2t5lUTU
         XvATvRd4FiXATsihHfCFiSIHMUk3rVS9H/+KCShczqqxb5lITJZQQoJmJqWLHihCOYQt
         z4ecKImewvqxy6zPlqyJl1b0cnRcgT6TkM9m4LUKJchsoMUNvrqOOWg/pdeFcoSS6T7K
         V6rz9sow7uE54MeXrxOGyggqCdgpPwixNSjdTningQeyrO9WoKPlPZ3hS8JsmGzmw56p
         zM6x+7Y5i+G93ypgvbIYSuE7o5lcH782GceV0xRfOy0g/FHkT5OTcVIdFzuKMidIURyX
         njNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UY9Yh5+RcrGMBGxz+TPC3zkoWx+8xh4wJ/vqKtGMJ2Q=;
        b=c1YUcIdS36wKuQpvAGNvQqbIM7vSk2b9pQ/nctdOOQt7bazj54OLxENws0QUUO9T9J
         Uomx1XiME+ZPODdjNnWPwZD2WEcjv7XZKY7F42r4FCtnthiesjj3/f4j/DciNMxl2UNE
         TD5C6Sf8chSqp4LSHQEp3e8LAuCDFMlMV4Ap2GXYprT+WlTuQe9dUEsgzNdKSrfibkRl
         woILD5SshR6h5zpNraPlHxv1XvwQQbF0AOVhqk1T1xJ0AVj/VXUnfGAVj8BH6KJv+yBE
         EbVyip6CCN/0/zXtcFmX2iHQ3ywxEY8akIl5z47qfHpKSMIpCHY0rsymxuuk6GF/ZTiy
         0/WA==
X-Gm-Message-State: AOAM530BB6svIfVS9hKZNB35wwad2u7fsXukospyZO+nGaGkAbOcEUzt
	Yl+OC4wuaLX2dtmJwe9YyfBdOlndmxcidJZ3
X-Google-Smtp-Source: 
 ABdhPJyf8/R8c4xIvBFVTeBgIs4hgOk4W0nayhxKWoXIxzCR4fjMxqSmzNiF+QWjjEKRp8khU68zqw==
X-Received: by 2002:a37:c57:: with SMTP id 84mr2210810qkm.699.1639456591821;
        Mon, 13 Dec 2021 20:36:31 -0800 (PST)
Received: from localhost ([2605:a601:a628:a600:d1ff:1ef4:15c8:ccc1])
        by smtp.gmail.com with ESMTPSA id
 y21sm11475507qtw.10.2021.12.13.20.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 20:36:31 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH][HONISTER 0/4] backport: "corstone1000: out-of-tree u-boot
 patches"
Date: Mon, 13 Dec 2021 23:33:38 -0500
Message-Id: <163945641994.7376.8892345272809667292.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211213163429.2499-1-abdellatif.elkhlifi@arm.com>
References: <20211213163429.2499-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 04:36:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2674

On Mon, 13 Dec 2021 16:34:25 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Backporting the features already merged with master.
> 
> Abdellatif El Khlifi (2):
>   arm-bsp/u-boot: corstone1000: arm_ffa: removing the cast when using
>     binary OR on FIELD_PREP macros
>   arm-bsp/u-boot: corstone1000: add the header file for
>     invalidate_dcache_all function
> 
> [...]

Applied, thanks!

[1/4] arm-bsp/u-boot: corstone1000: passing interface ID and event ID in register w4
      commit: c6de028d35e40e39068edf95d365cc4cb57246ad
[2/4] arm-bsp/u-boot: corstone1000: make capsule guid check platform agnostic
      commit: 4bb0d10188cb7d74e1c17480dcc914c9ed26a4c5
[3/4] arm-bsp/u-boot: corstone1000: arm_ffa: removing the cast when using binary OR on FIELD_PREP macros
      commit: aaad1117abd3b5d073837477e208a53da5e1eab1
[4/4] arm-bsp/u-boot: corstone1000: add the header file for invalidate_dcache_all function
      commit: d206e22c088c160a95e62d94a65690bb6e118081

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

