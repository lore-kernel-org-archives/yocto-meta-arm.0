Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D623DCDB474
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 00:47:12 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.272049.1697590031448299443
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 17:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=fB9FN6Mg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-41b7fd8f458so8956801cf.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Oct 2023 17:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1697590030; x=1698194830; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfaojE/9zJXQirl7YT4CaR2pZdm5JGTXssjTNYP+iQk=;
        b=fB9FN6Mg9N6ldyvw2KibIgoWn19eaIako5q/ko6WmkmQzBLRsBm3w93lbIsplfgb0n
         IYFknc0RGkHkHrUgmB1tNGo+yisUM5uc32SV/81N04cSvtKLIS+HtBp0bTMiwbDrI4sd
         LGRP0CvrIX3WOAuQ1/QhhF1zC6W6tCOaxq9Ng+L6lEQFfgUf5mMuMIoH+4hpCBcImmtI
         J0R0nYlAb3HtDfpMACegj0J8OF4Xgp/s6ph46y2vuUK43tyjOZgi8Nuf2/7vCdQujS3m
         w11ZdPjRGCpJJpIo+WA+B5w7ajqqsK1By11VwKme1zTXoRaCXCFxVQ9ztTvoWtUEbR5O
         hwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697590030; x=1698194830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfaojE/9zJXQirl7YT4CaR2pZdm5JGTXssjTNYP+iQk=;
        b=Dko46KbBfqqPJuRkkJyUTVoZbfThDHa3sF4bDiFeFWX4QDLLm9SvF1mUNYSKCoJkQn
         pMm3KEhrbQyuCqc95OBimICVIneVKYSWFZnMjiuocYKiiBTjVCXQ8EicVZt79111hEgR
         a0Fheic47cB+eHr5TvuqRUU5JSl3Fp61y53BsBfPt5iHP0EdyZTIBTzFQuhMw4yqE2Pa
         HajsfL3R04tUeC2het7wBgtLrmjCuzgc47uhPikDXORV6orGMwpjUrO7sqPz1yA0tu8g
         SA6jReZzJlSoHGkzDIlEJd3/SyhHMC4/Nyy91Mh+ShTq0RS0DlphLcUVbEb0CPGIXoJa
         E3Aw==
X-Gm-Message-State: AOJu0YweFBWlmv1uoPJWgI8Wqtg6tvNXVX0Nd/5Td/hXl1wlcxl5nvs+
	o3dQiAX5a3VtIbuz1cO32qH36HL9jIu1dFl0VkM=
X-Google-Smtp-Source: AGHT+IGlWy/oldmYjhjZ1Kz2fyYk9l/RdvXgLi9UxqOzT0247+HNB7uZetAEj3X9sfusLRyUUkjodw==
X-Received: by 2002:a05:622a:1982:b0:418:ff8:3833 with SMTP id u2-20020a05622a198200b004180ff83833mr4617762qtc.52.1697590030032;
        Tue, 17 Oct 2023 17:47:10 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id j11-20020ac8440b000000b0041cb8947ed2sm431900qtn.26.2023.10.17.17.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 17:47:09 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	xueliang.zhong@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] Update Corstone-1000 doc with security issue reporting guideline
Date: Tue, 17 Oct 2023 20:45:43 -0400
Message-Id: <169758994326.395951.10481613423661340752.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231017134649.2865499-1-xueliang.zhong@arm.com>
References: <20231017134649.2865499-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 Oct 2023 00:47:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5139


On Tue, 17 Oct 2023 14:46:48 +0100, xueliang.zhong@arm.com wrote:
> From: Xueliang Zhong <xueliang.zhong@arm.com>
> 
> Xueliang Zhong (1):
>   Update Corstone-1000 doc with security issue reporting guideline
> 
> meta-arm-bsp/documentation/corstone1000/user-guide.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> [...]

Applied, thanks!

[1/1] Update Corstone-1000 doc with security issue reporting guideline
      commit: 7d651e01fbd8f38bd31e67c17eb517072af0e1ed

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

