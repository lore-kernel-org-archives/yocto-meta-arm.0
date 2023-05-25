Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48765C7EE2E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 00:52:15 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.1921.1684975928722978760
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 24 May 2023 17:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=jt3AlL9O;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.43, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6238386eb9cso3726316d6.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 24 May 2023 17:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1684975927; x=1687567927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFVIEnderRpkN20qkXB7vT4+JGBF+emaauMUYGyRxIQ=;
        b=jt3AlL9O7/i42RAEvnRQ8WxlsxeFJFuDgX3LiW5Llzr9AtKcFn7O2ozwAir62EczjN
         L6lmeGufy4u3Y+1p89wF1Pkefi8th9CFVrQFL9jnduXsX8PuaolyscOxPlCG/1AKio4u
         +pz4+vyR5+/GpvlUGgOL9+1+ShIOlnDUvtHU4S+rKGRkmLJ6Wbm6Mgcp4Hl7oiACYsyv
         iisnEp62/ENmFQJO0Eiyah4s2mMn6gauUtNVqPfh+e+KWHhFEzdhNu7pt1gx73MWcVe9
         A5zvfmSWux8kdsTf6pfQyQsO1kYQQ+UWcqBSSxa/lek7b8GMFFKioToMt7b4JsXDdr5D
         Tb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684975927; x=1687567927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFVIEnderRpkN20qkXB7vT4+JGBF+emaauMUYGyRxIQ=;
        b=DO9Zg/f7kaWk4EVBfZg+yLRyGLbVi5JvrT4IGz3SK/QCUQLGipBShu/YLQ/eeRy+8w
         /vXXWWNbS2sp89XGwze23C1N4yvR30Meg2bYI2W03DZJpL5czk8VqNy1o7lI+bNkMx1X
         M6fwpJ80ysi8N97TmhwnDw0DuOzEkfPdvcadngm+RlgAWijYgS0Rnq+paO4AQ1tiRD0J
         +AX4+XZV3KwCY/5nJiznVa/3SsB45aEGl6BTWZ/CJUwCkoP3OKGutUP+Xkz36fxAV+zi
         AGSv1Z1Y69Zn9uF2ENVIPXkDjxkydOJPE9HXfw0BecHwynNHUc8X9TlDD4cAGTunvOnO
         vRTQ==
X-Gm-Message-State: AC+VfDy3ck2Ut68BsBwFnQkh+jfbezWwt8xTvSpS1aB+PYo69sciMftX
	w39baun4U3hsJ/3mqE1QY4zrlCgn7/bt5zUa7Dg=
X-Google-Smtp-Source: ACHHUZ7OBrcSbYJd5kQ5Mxd8/q5I01w8pbfPQ5UU3BZyw/XKRhlg+y9Wd48VzKPTh6Rsg3RRx7i1XQ==
X-Received: by 2002:a05:6214:21a2:b0:621:68e8:999f with SMTP id t2-20020a05621421a200b0062168e8999fmr28468473qvc.33.1684975927510;
        Wed, 24 May 2023 17:52:07 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id z4-20020a05622a028400b003d65e257f10sm4182323qtw.79.2023.05.24.17.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 17:52:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	=?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: Re: [PATCH v4 1/2] arm/lib: pass the PATH to fvp runner
Date: Wed, 24 May 2023 20:51:37 -0400
Message-Id: <168497589902.1985833.6057190683835370483.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230517094044.84867-1-peron.clem@gmail.com>
References: <20230517094044.84867-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 25 May 2023 00:52:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4698

On Wed, 17 May 2023 11:40:43 +0200, Clément Péron wrote:
> When running an FVP machine the model executable need to be found
> in the PATH environement.
> 
> At the moment the script doesn't provide any PATH to the subprocess.
> 
> Add PATH to the allowed environement variable to be forwaded.

Applied, thanks!

[1/2] arm/lib: pass the PATH to fvp runner
      commit: fa598021fb387e98bdb80861f245cc15acde4ca5
[2/2] scripts/runfvp: Fix KeyError exception when there is no FVP_CONSOLE provided
      commit: 316e02c0f13b473e916cd779e59f0d55d48e4962

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

