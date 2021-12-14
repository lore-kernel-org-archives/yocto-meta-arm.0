Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19869C433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 04:36:40 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.21821.1639456599555004229
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 20:36:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=GK3nrAs1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id f20so17428502qtb.4
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 20:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D8fEgT7xvjHT/I54IErGw0u4oeR9xQvgEQE4IeSVyuo=;
        b=GK3nrAs1HEpkrkKBsPZCxv7cKH4ypSwV/596MCpdI/mKN+YT/LpZBiy2owibMcHVbr
         fKM5dFlbOFqx9j/ZHE8P83+8L5balg0drKnb6IU2+VZDCuK8x36hnwGKjBLXin4KGT1F
         OlmIk1b3qt0HxQoAMo25UB05ddVltZbXBaFfnrfq3T51ZaVadkpt2wdZ9ftLW67sQjtR
         NL10pNSjiw1G8Vrj2TeaGRcNs4lLoyuoHoqAqcyWy+jqHck4ZmMVEpYBStJ9NRrFnqRX
         aK+6h/62cP9aiR2Lz5ZKjOEWT1Up3KunxMdK+Ps5PYf3lix8vdpt9kfnWyqO+8tDXu8+
         RL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D8fEgT7xvjHT/I54IErGw0u4oeR9xQvgEQE4IeSVyuo=;
        b=1HVXWEwGAM6aheARZsguIhSWE2jvDGYLCp98i1MKu4nojGzml36llzdehxsSVMne8P
         atSuAveu/IFRRyQasAYr5kh+aHIEzhcOKUfPLWyrxZKcLDXziF5yxhykdPqeCUAWpKoA
         O0oh7PLp4oFxwJFT8Lkrd3M2gsMQ8jLENnoYcgKpX3KCcCZD9x4i5zjzjbuKRaPM1RW3
         r1mME6v6YgVcxk/bsr4ASce8+HSpPEGmMA4NPDJregHgvtn90lu7/feE8J1rjMBcjLMr
         3PqScqzLswa46/0qNnBeGf9kbwJ8nHOnDDvVy7+UY7Alt1FCSVWuLeX3g+ENunQx7uAw
         WFTw==
X-Gm-Message-State: AOAM531rhUaZAqI69c4k3GUQSwKCet+YeDWlSUUyJxDfGbhAbPgHMK42
	Drdv2qyGggGYei8MvwXGspt8YDd36Nw0KqSD
X-Google-Smtp-Source: 
 ABdhPJybgOhT3zpZdRSwXwRERkN58IFFvsECSpxqKjXus83kY6Tn2T8nivkm9i5FQ1Fhs0h4YzpX+w==
X-Received: by 2002:a05:622a:293:: with SMTP id
 z19mr3533894qtw.46.1639456598565;
        Mon, 13 Dec 2021 20:36:38 -0800 (PST)
Received: from localhost ([2605:a601:a628:a600:d1ff:1ef4:15c8:ccc1])
        by smtp.gmail.com with ESMTPSA id
 v1sm11580946qtw.65.2021.12.13.20.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 20:36:38 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH][HONISTER 0/7] backport "Corstone1000: updating
 source-code and fixes"
Date: Mon, 13 Dec 2021 23:33:40 -0500
Message-Id: <163945641994.7376.11450733424800116266.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211213163102.1039-1-abdellatif.elkhlifi@arm.com>
References: <20211213163102.1039-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 04:36:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2676

On Mon, 13 Dec 2021 16:30:55 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Backporting the features already merged with master.
> 
> Abdellatif El Khlifi (4):
>   arm-bsp/trusted-firmware-m: corstone1000: bump the version to 1.5
>   arm-bsp/optee-os: corstone1000: unpack sp_manifest_combined_se.dts in
>     WORKDIR
>   arm/secure-partitions: introducing a common file
>   arm-bsp/secure-partitions: corstone1000: using the default SHA
> 
> [...]

Applied, thanks!

[1/7] arm-bsp/trusted-firmware-m: corstone1000: bump the version to 1.5
      commit: 6ee207b52009b3b8e71f8d606ab0f02a7b45495b
[2/7] arm-bsp/optee-os: corstone1000: unpack sp_manifest_combined_se.dts in WORKDIR
      commit: e53bc984f5f1e7d2ddd8cddea8bfe951a52dfdce
[3/7] arm-bsp/secure-partitions: rebase TS patches
      commit: e1c04fd924533770f74687bfbac8bfd40df9eee9
[4/7] arm-bsp/optee-os: cherry pick fixes from upstream integration branch
      commit: 9b0ddd606e6bc81ee85cbc23f2f87a6818750a83
[5/7] arm-bsp/u-boot: corstone1000: Fix GetVariable data size issue
      commit: 37d646c3b92a55f04d1a6d1c4869c9e400db594f
[6/7] arm/secure-partitions: introducing a common file
      commit: b94c50d291234b01192c7b724be077733b71c40d
[7/7] arm-bsp/secure-partitions: corstone1000: using the default SHA
      commit: 42061ba8ce1d3fc685b1b2cdbb7d36745e45e9ca

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

