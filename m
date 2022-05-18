Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F5DC433FE
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 20:30:32 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.1639.1652905810914246221
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 13:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=0aNGfo8p;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id m1so2465305qkn.10
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 13:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=YxEJjl9Dk5DXkDFna2M7PMiuXGv0WyuuAvQmRX5xZfs=;
        b=0aNGfo8pRTMjoeTVovs6XYVPRpc54W7Rlit6zq8nMJBV4UASm8DEHBVzCBjrB4qL9R
         aq5JtSs3DNZtohm5XuhVX0xKsLrwVcYUkdUz8LpQ3WShUBC/yoP2cb2Zw+wxn2hB+EkN
         1xaNl+OwKAUuZgDurjyhJcDSgVcyQDuCFD7rajPx8VEY7H+GWK9Te8ppHSjH5tmexMEa
         7/a8+N17dafamGs/RzTKacdZICeh1qswizo8zJk7WXl9EE5TuS+WbNuS4uQKIvQw2Oms
         LKLMn63LB34uyRN/QTQE7PH82q+GjM6P1L3b3zpMTN6FeXFpH6K4gfaPzqp0yUcUgBgo
         34yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YxEJjl9Dk5DXkDFna2M7PMiuXGv0WyuuAvQmRX5xZfs=;
        b=vxRLL52OfyRkBgm/ob1jXi1XJCXUg7MAyx7ljEX8DMFWJ0W88QJ2bYhQ6WUVDpMF8D
         BJTvIFK8mhz2xM8b2sRBvUOLosgJsuMmrR1KAtykBn8qqMsGJTkzO+IPmccieY6+cioZ
         cV+BHUUk9mqM4ZDdVhUonhuyMmQoQWvxhoS8z/SX5gS6sz5Bnq2EtrcSsv8rQyHCMFnt
         R0uxrxeA0l5DWi+oWpZMT41LPZ0s48W7p/7SBop7VDm64Upw4q16GFK7Ni2KdG+pWjkC
         LXcyJ20pkmztJZOz35Je3XdbG6EZWddRXrXL64K7Eg1Kr0ejK5yiL1CH50fhNrnd0Y3Z
         Sevg==
X-Gm-Message-State: AOAM5309EmkA1NEJh1wyFRjy8FVK3QLCOg1d7FSMHwzki3WNKU2YUtj8
	+uHGC+dbAyGydRK3jyPzlQGqwxQNbY2IbQ7c
X-Google-Smtp-Source: 
 ABdhPJy+dKXg8EmI1sMFvMdsLcJs/tSC7ij1CuJIw0fjEYucKJ+X1tXab9qIOZxCVXmBuTpSiYu5Zw==
X-Received: by 2002:a37:bc45:0:b0:69e:b768:5408 with SMTP id
 m66-20020a37bc45000000b0069eb7685408mr939894qkf.390.1652905831484;
        Wed, 18 May 2022 13:30:31 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 b16-20020ac85bd0000000b002f39b99f6c6sm105946qtb.96.2022.05.18.13.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 13:30:31 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/4] arm/scp: remove support for version 2.9
Date: Wed, 18 May 2022 16:30:17 -0400
Message-Id: <165290581936.1529216.8382569013138102402.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518133624.24874-1-jon.mason@arm.com>
References: <20220518133624.24874-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 20:30:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3444

On Wed, 18 May 2022 09:36:21 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/4] arm/scp: remove support for version 2.9
      commit: e50f5221a368f552333911670647808b91d78a18
[2/4] arm/linux-yocto: remove tcpci for generic-arm64
      commit: 1b7f2975e445c4dd662486c88abb6fd74835a2bf
[3/4] arm-autonomy: remove README
      commit: 8445f99eb0cc2f09b813a03319a530fbcce365df
[4/4] arm/machine: used QB_GRAPICS
      commit: 96941ae4cebd30d7b15473e904af2aed90af1e56

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

