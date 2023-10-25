Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79F99C07545
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 01:32:44 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web10.164575.1698197563771054766
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 18:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=l/UohduV;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.53, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-66d17bdabe1so35233206d6.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 24 Oct 2023 18:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1698197562; x=1698802362; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZK9MN564I0hpQVBumYCwpArc6qqGio4YkbmsBJuVGkY=;
        b=l/UohduVIhjzJCO+VO/HP/YO8kaW/h+GWSIwSJtjAStK4eX8nHJqcHElu+h1sWB/4U
         Ff4KVLq2JJJIYDDh92l3fGCggKOxNn7F3DSz3HoqrEwML4DO3CjFOZNOHvhFCQFhvA/3
         bWlCSSq/dFrSUwbxA6wtRpdzO4rDJuImqvaBWaRaSL92Nq2nwVXLCkwtorX94nh9kLdc
         55csUWXZHe1uMXXtEx2H0LdSfgVE950VMj45OS/80qimse8ZeBBaCI59eS6Grqd5CL5R
         3A63lspcx2FrpHX7De40QYiyivP1X1Ab/oogjbxqOLLC2niMZ/exKstdsOfZIiNnQU8Q
         NYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698197562; x=1698802362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZK9MN564I0hpQVBumYCwpArc6qqGio4YkbmsBJuVGkY=;
        b=QeSfVUt1c2i5qx8dRcJZnCsnUtA0cnzb0QkBcIgZnE+nPcfK3xyxsn95Dwfgibdj17
         ztm7CoyYbGOjAgV2gDmSgvOJ02dzrWlbQOEPs+42NTlR+vkN6oCEkMZ4XY7jUHTOyShv
         sLbXNEMsdy7MA79DKgKdKeT2pRll3Sil3lHpi+U7QOkwSvgRpuYXWd3JzkVYw/RWDh2C
         g0SCxqmXwWfzsmhwTTkxrHwiJ+N9ckb1ClQsQWq7EOWugrOs9CC9mwK6Z8aEMHHcfIuS
         hISmwuvwNqT4Mg+BpKjJZPKzFvb0UT8nQCpQCxmgQj1hTqB8Wu87d8ds97U2pvj8L3Pi
         8p5Q==
X-Gm-Message-State: AOJu0YzOKEQz4iWT7YowZvuwNKVqpPdhWw0Jt3eQ+OSgArN1hwp777yd
	zLdP+WBu5Yph24TxxTDLsCSZZ7nS+8UOFBtHiio=
X-Google-Smtp-Source: AGHT+IHKAyJUBxkx7r8S56hnXlo5LfVxXunLqwNZM58ywNCABuGDPotcLWP5qCrZRKheESMjL1ZA5A==
X-Received: by 2002:a05:6214:528e:b0:66d:3474:a93a with SMTP id kj14-20020a056214528e00b0066d3474a93amr14126329qvb.30.1698197562396;
        Tue, 24 Oct 2023 18:32:42 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id dy19-20020ad44e93000000b00668eb252523sm3947762qvb.63.2023.10.24.18.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 18:32:41 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Debbie Martin <Debbie.Martin@arm.com>
Subject: Re: [PATCH 2/5] arm-bsp/fvp-base: Merge fvp-common.inc into fvp-base.conf
Date: Tue, 24 Oct 2023 21:29:14 -0400
Message-Id: <169819735774.1892682.4836911719378693189.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231020123827.346193-1-Debbie.Martin@arm.com>
References: <20231020123827.346193-1-Debbie.Martin@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Oct 2023 01:32:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5167


On Fri, 20 Oct 2023 13:38:24 +0100, Debbie Martin wrote:
> Merge the common FVP configuration in fvp-common.inc into
> fvp-base.conf since that is the only place it is inherited.
> 
> Drop setting MACHINE_FEATURES to "optee" because there is no
> optee machine feature.
> 
> 
> [...]

Applied, thanks!

[2/5] arm-bsp/fvp-base: Merge fvp-common.inc into fvp-base.conf
      commit: 05d631541f58138a966f3d9f0ce3d7fd05007bd8
[3/5] arm-bsp/trusted-firmware-a/fvp-base: Add stdout path and virtio net and rng
      commit: 809b401938e7f7f786b3afce1c388836c42af052
[4/5] arm-bsp/u-boot/fvp-base: Configure FVP base U-boot machine and enable U-boot sysreset, CRC-32 and virtio RNG
      commit: e4fcfa534de5c66c1917bd11af5ca05d7cb3fa7b
[5/5] arm-bsp/fvp-base: Configure grub as the EFI provider
      commit: 0262fee5aaabc1c84552e8bebcb12da7662465ac

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

