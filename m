Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC2DC433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 15:46:08 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web12.1101.1652283963044252119
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 May 2022 08:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=tOgv/7YL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id a22so2569486qkl.5
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 May 2022 08:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gzn1EOSNqxCPQPHVDFwixmJ5SDUI7+epEuoBI9IOJso=;
        b=tOgv/7YLfzKcES1iYMTikIVPzKGk+rVYJQHItM42f1CrEQ6Sxulp2Zex1qcti0gCSK
         2KFN82C25U8MaT7Slhhj9Bq4kOZPN0cRZM9Roc/AyxFOIUvpG2ZJXrPW+cmEhnO6zcUz
         006wjhKbyMdMGtPGCx9K6PPITNaUUkrjWA8oCDWcx/MZOxpFSweGTFtoXR7o49rz2heZ
         gkuBKB1qNy8jxfQ19CeMUFbrQJAjL7A/Swc3oag+namFqOg5SLpRgh0kpjihERGZu/1y
         gMuvFsNiXrMkhLwbtB5dl23/ERrHzrwKVq8y1xMpTHxMXJPlyH8YUOB/VpPr8+BXgIqo
         8a5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gzn1EOSNqxCPQPHVDFwixmJ5SDUI7+epEuoBI9IOJso=;
        b=iHkvLNMrHWgkCKiE4bLDQ9x7OGns8mz/BwRuLQZcJkl4/6guLAaH8wlFbXETuH3okT
         LFAUd561IDyDIL2KJGSHIkTjcrhuqvp0iLXeovPvt254S/XFwNtvtDA/5rZmjglgUMrB
         c1yxxtUczIcQbGSw97nk7PWjeO7WQ+GKwVIF2piSRWdE1vUbXnlUHLd7VcDHaoA6nwW+
         GcR85Qcj21g57sJYK5sN2OKllwPAVq0vBz8ui5m+puvEp9GW7/9ghLMdvF713Ppb2ABk
         gNfn6Q9xbbV1U4RzH8LNuPh/Y2z1pSQMqSipqmJqqA9k8YHYrpT2VywoFsn+VJhi0Lst
         f29w==
X-Gm-Message-State: AOAM532z63QiNzRtpc+M7TNUNpRpfEn2HIo+waNNPl37WsSquX73C8Cu
	7jcV9KE/oKGiaR3KOURVSS28Sw6dksuSHe+4
X-Google-Smtp-Source: 
 ABdhPJwrhRTjrVWU6Zf5MhD+rNdlSc4Yo583JXFuXpNbyN2OWe5omZPM5N50LYr92TLqV/WyAsagtg==
X-Received: by 2002:a37:66d8:0:b0:69f:be4d:208b with SMTP id
 a207-20020a3766d8000000b0069fbe4d208bmr19686626qkc.83.1652283961985;
        Wed, 11 May 2022 08:46:01 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 15-20020a37040f000000b0069fc13ce21esm1322279qke.79.2022.05.11.08.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 08:46:01 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] hafnium: Fix build when _Noreturn is not available
Date: Wed, 11 May 2022 11:41:15 -0400
Message-Id: <165228367703.3678131.11848110424746360442.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420054235.3727707-1-raj.khem@gmail.com>
References: <20220420054235.3727707-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 May 2022 15:46:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3385

On Tue, 19 Apr 2022 22:42:35 -0700, Khem Raj wrote:
> 


Applied, thanks!

[1/1] hafnium: Fix build when _Noreturn is not available
      commit: cb2eb8e3736be072735d35bb69f0e3be8432843c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

