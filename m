Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57764C761AF
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 03:21:32 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.61934.1680492090241197895
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 02 Apr 2023 20:21:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=0ifdxnX+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id ev7so1244663qvb.5
        for <meta-arm@lists.yoctoproject.org>; Sun, 02 Apr 2023 20:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1680492089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eh6rt7S5ixsVveWM68zWF+XtXYRKlqUQzPS2SVexO8c=;
        b=0ifdxnX+m7ezrJ3z/EbdjBiXlXfYo6OXgeQzwXJibAuWDz2vvqD/+xdzxc/HSpurzH
         DfJ/U0sXRmRdwuwzc/6Z6pPEU7qR958EYXm7ElDQ4w5kWEQsV5WLtsXUMkEk3A0rwzit
         eSz957XF8iVUYQsv/9uF+Rvx7ETYKpg8iqiEL84d09hAmzwUJVecAOqpz1fl4OFQxME5
         XjVkHtHw4C3UZxrlayedZV1mIdAvrIBt0DjS7/16G4lmmnO26/WacmaVirlcKlksM8Ux
         x8gBcL2wv+rutnmbTUIuCsIF4l1M94VvFAH5mW+nagX6GdL0OeP5ZOfGE+Msodkb63Us
         /Ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680492089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eh6rt7S5ixsVveWM68zWF+XtXYRKlqUQzPS2SVexO8c=;
        b=G+NBT5Mz/rrqVAiHMZiI+newH89DJT8y06VtfjzzcUCuuMvh5XFGRr5GgxRDKUijvx
         IWo3m67L5VFtHQVhcrCWLCglYIBmPHKk7JR21ONroKHU3I/e8pFRT27H8AGUJ6TYp53j
         RYB4m4OMHfB2CuKL8jBtJLMQzLLGsqjy5iG3CBS6ihU4TzR7S1jBlPA4XtIrxZJNixmx
         uTJF/40HclHEIE6yE2Y44Oj3srnrQz56j+0h0cTadbqqA+er5p+7bUQ+o9Ja9Os/w1Bz
         V0yjlyIRZ5pj2ly6bFixkYxA6CpklWUYGdgNsUP2eHKg68JdT5koAib8OuNvcNGhbL7K
         5AoA==
X-Gm-Message-State: AAQBX9e8FAj6ZdEk2GAkNy7buzMJ4vs1hqI/01GA8khtXgtngnwk9uKH
	eMMEdMSx109MOLqio8DTsCm3ml1WINIYeYLuOxw=
X-Google-Smtp-Source: AKy350ZuxCaDYhPGHDBYg2SngULIAEys3tJvZy2MJoCINMGS6c1UIdiQGvf77DdtKotH8MSv/rqXiQ==
X-Received: by 2002:a05:6214:240a:b0:56e:f9a2:3eba with SMTP id fv10-20020a056214240a00b0056ef9a23ebamr62518323qvb.41.1680492088886;
        Sun, 02 Apr 2023 20:21:28 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:15a6:cff9:108:de91])
        by smtp.gmail.com with ESMTPSA id ea7-20020ad458a7000000b005dd8b9345a7sm2320588qvb.63.2023.04.02.20.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 20:21:28 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"xueliang.zhong@arm.com" <xueliang.zhong@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/optee-os: N1SDP support for optee-os 3.20
Date: Sun,  2 Apr 2023 23:21:04 -0400
Message-Id: <168049206444.2209125.11892857937104192058.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230331191434.8363-1-xueliang.zhong@arm.com>
References: <20230331191434.8363-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Apr 2023 03:21:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4533

On Fri, 31 Mar 2023 19:14:33 +0000, xueliang.zhong@arm.com wrote:
> This patch adds optee-os 3.20 support on N1SDP.
> 
> Xueliang Zhong (1):
>   arm-bsp/optee-os: N1SDP support for optee-os 3.20
> 
>  meta-arm-bsp/conf/machine/n1sdp.conf                          | 2 +-
>  .../files/optee-os/n1sdp/0004-Handle-logging-syscall.patch    | 4 ++--
>  meta-arm-bsp/recipes-security/optee/optee-os_3.18.0.bbappend  | 1 -
>  meta-arm-bsp/recipes-security/optee/optee-os_3.20.0.bbappend  | 1 +
>  4 files changed, 4 insertions(+), 4 deletions(-)

Applied, thanks!

[1/1] arm-bsp/optee-os: N1SDP support for optee-os 3.20
      commit: b3c60cd3fa274e7829aefbedb6db8a1cb9c8f9e6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

