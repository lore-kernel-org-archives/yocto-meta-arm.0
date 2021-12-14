Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C68CC433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 04:36:38 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web09.21940.1639456597207264983
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 20:36:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=VeQd6ww1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id u16so16391707qvk.4
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 20:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BktL8wzTMorzAgCPs197gWp9cYqbDlTF3RG9EU1s08o=;
        b=VeQd6ww1qzItfE2FW0uLtkRGuavBBgRDQ+liVl7gRfJTg0c4xTktcrRdyIoNqS5QcD
         L8Qbene0FP71H+nWhj3jITC4AM0h0AP/VwzxRNmPeEHwaIhcOlIW874SdsG1VaT6Kf7m
         LuCKI4aHy5vF74q+IQm3HiBfmEOyHPxSX2+zHVFhM31Kxh70oR+Rn6V/TJkrt2KacEFT
         94gGnSm748npX8e4ZAvNQMThV1gEVTlmE3Y7AioDxVDyRPsVEVkZYxUWrvA324puuetn
         wVomE4be2Vyt9sIifeh8PcStEATQetqWFb3R7jKY/A/bQCgvsKgZQVdlPyAwAKR8p8kO
         BYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BktL8wzTMorzAgCPs197gWp9cYqbDlTF3RG9EU1s08o=;
        b=jwXqibZS2wRsoUuFYVz7gJI+lQo/JcOtxCXppAwKkYdcb5E5jm6dT8SAPoPmcTjgET
         fTpVngWoMVGRoTHYZ0wRAUMgUUzjWIKiLH/xjCC31H1YI+r2feBn0xye3E/I63LppWQV
         t8Mx1xyYJHK+IEvyoycddrV/OtNA7I76HGaD+4ZfoWVIXN5dqNLQnrCQOYEpagQaJAxx
         Lq/d3Mmdm8s8VEcumq0zBYqmSR9cyzFLfDnTUh1TkWxyFvISBfZjbpjBW/BN3R1xPK2n
         PEEM5KDjsp5xWrMWVhQMU2+iQeryYpvAqr2wjt92Ts1YwPD4RRBzy+g8396oAiXbXSdC
         RTLA==
X-Gm-Message-State: AOAM533huXpztaf3GjtLoFrr5QOMAzaGCCJqKQw2xL5dJcVpVM0ljNfM
	Eypw5vo4S85CfbfjTD5uFLwCy8gAAwjpmfvT
X-Google-Smtp-Source: 
 ABdhPJz/BTwadsMXGXMRhY9Lb7UjzNSlsVmKGh0gcTcCT0PXiOyOJ+AW1yqx74zmLpwbfkLWHDxXJA==
X-Received: by 2002:a05:6214:d0e:: with SMTP id
 14mr3107306qvh.26.1639456596236;
        Mon, 13 Dec 2021 20:36:36 -0800 (PST)
Received: from localhost ([2605:a601:a628:a600:d1ff:1ef4:15c8:ccc1])
        by smtp.gmail.com with ESMTPSA id
 r16sm11302923qta.46.2021.12.13.20.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 20:36:36 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	abdellatif.elkhlifi@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH][HONISTER 0/5] : backport: "corstone1000: psa-arch-tests "
Date: Mon, 13 Dec 2021 23:33:39 -0500
Message-Id: <163945641995.7376.15999374928929356524.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211213181802.13323-1-abdellatif.elkhlifi@arm.com>
References: <20211213181802.13323-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Dec 2021 04:36:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2675

On Mon, 13 Dec 2021 18:17:57 +0000, abdellatif.elkhlifi@arm.com wrote:
> From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
> 
> Backporting the features already merged with master.
> 
> Abdellatif El Khlifi (4):
>   arm/secure-partitions: remove the use of EXTRA_OEMAKE
>   arm/psa-arch-tests: introduce the recipe
>   kas: corstone1000: update meta-arm-image SHA
>   kas: corstone1000: update for new Kas include semantics in kas folder
> 
> [...]

Applied, thanks!

[1/5] arm/secure-partitions: remove the use of EXTRA_OEMAKE
      commit: a68fa362d2349111801d170847e423301cbc21dc
[2/5] arm/psa-arch-tests: introduce the recipe
      commit: 0acbf59a8e6cde6ba3fc92a9f040340162d41b41
[3/5] arm-bsp/psa-arch-tests: corstone1000: build the test applications
      commit: a56fdf433329c25c898cf884a3567a0dfbfdf040
[4/5] kas: corstone1000: update meta-arm-image SHA
      commit: 1e3cea589d24397fd084c3218a5402569405b222
[5/5] kas: corstone1000: update for new Kas include semantics in kas folder
      commit: 42347ebaa2e121f9e5c6b796d18222aa58792a27

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

