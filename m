Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2824FC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 15:05:45 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.37909.1702047942283934252
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 08 Dec 2023 07:05:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=CFSqFUUA;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-77f3183f012so98991485a.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 08 Dec 2023 07:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1702047941; x=1702652741; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCu2YVGeCWbSeUGRRFTBOrHjDOV0Lr+0+N0Gk1QjZ0U=;
        b=CFSqFUUA5mxoFeHgfhTIdKINO/chImn3iMA/eWey5e7ZRLgNN8OXuQXkSmwOefVoL4
         Zb8jExTtjeG3YuY/DNm1sGefVzS2vXTDmRvQxSZcvlqam1S2Eo70aMxjqy7wPpNYZogr
         okI6kP4BhGA3f6U3zJEQprkqSKrAy19r9YVXQvUZVSNFHJlfjgyX/1F9c1vYFwQFZ4Yd
         7jVQhvl+d8zVhPS81qtHQEQaWUIGjh/SjjMX9DQsl/6InLnn/LltH85sm26jR+W+tRxb
         mBb7JQyb9A4RpLHfRJyLISCWh7GjCx6aInaBzZ9CRX8t444Q1kGwjuqjhA7HDIXtIZub
         pOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702047941; x=1702652741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCu2YVGeCWbSeUGRRFTBOrHjDOV0Lr+0+N0Gk1QjZ0U=;
        b=giKnj29WHfOKFBwb7yyScrTKOw2YbfjceR48P1e8xd7FWQkX/7nw54p3/SfLfoFb25
         +bZI6Oe/LB+JWYdZqnRH9AltT4SmPCRT520mW4JTX1EwN71nD9f2aYfYYlUP3pPeXLQB
         xVN73MeSVzSIzcozltNI93mmyv9fubS+PBCue/W2+kW7P1V9kFCxsV6ImwJqJs3l0MCp
         VtPhLYxb4/N3AqEwddaci2ZEpioW0s1qbJ+TQ0aWF2/NYygEuXHzZWlzLsKDuTtW/UA/
         sWaeXnd/rG5BT5oAzEMnMSbgjE0qGSbT1d9C9X94dbZg/DEWQTTFlIVplsV6yxAjK0eP
         Pw2g==
X-Gm-Message-State: AOJu0YzVMdyBORDzS8O+z8L7rc/oBuKZ1AB4FIurE3A0R47F1/fEkCVL
	d2R/FpLLsUXuGtMnZc8+ex2PT/sOMhvdS/Zr7As=
X-Google-Smtp-Source: AGHT+IGQ+XhFveHdFmUrZAttMaq9648y0YcCxbzdvDcTVAnMiHwIhjc3xcy/1SYdn6Eduj48TC/6Jg==
X-Received: by 2002:a05:620a:480c:b0:77e:fba3:939a with SMTP id eb12-20020a05620a480c00b0077efba3939amr209540qkb.124.1702047940805;
        Fri, 08 Dec 2023 07:05:40 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id u14-20020a05620a120e00b0077d73fde842sm743758qkj.56.2023.12.08.07.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:05:40 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	harsimransingh.tungal@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/optee: corstone1000: Update optee to v4.0
Date: Fri,  8 Dec 2023 10:05:14 -0500
Message-Id: <170204791507.1836421.6877580546479649215.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231206140006.36213-1-harsimransingh.tungal@arm.com>
References: <20231206140006.36213-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 08 Dec 2023 15:05:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5299


On Wed, 06 Dec 2023 14:00:05 +0000, harsimransingh.tungal@arm.com wrote:
> From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
> 
> This change updates the optee version to v4.0
> 
> Harsimran Singh Tungal (1):
>   corstone1000:arm-bsp/optee: Update optee to v4.0
> 
> [...]

Applied, thanks!

[1/1] corstone1000:arm-bsp/optee: Update optee to v4.0
      commit: 553cadc720f018fa81d1d5fbc131b654a1728b85

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

