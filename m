Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F584C38142
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 02:01:45 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web10.64801.1674180094997460807
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 18:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=WWVznSkI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.179, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-4b718cab0e4so53486557b3.9
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Jan 2023 18:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QoEBG3IUvLPkgPYavCJP8mLgD6KQ/3QP6itA+SbBow=;
        b=WWVznSkIonzj5RmDdf5PUUUBo0XRZmbWr44DesHpOwOKJwNP+VpiTCRfR0JKiIJOuG
         u4o6R4mfzov8Q8FnQ40QvAkF5GZfmI0So6y4c2RZnZqYOV+WMi+mRdpdD/rWkwDvlILy
         Rcn2LmuVAEiVpHuB8lifMAldRMAdQdYwKrXzmVUeAR4KQkWOWVseZQ0go3XBj8l3gHdv
         ZX2KykIka0Jh/XxzVoROaaTS6UIm8bqQPVyd8rkZ4N6K5OYFTac28/aeLSKnm5kU9WHu
         vnUPATxxZbrruFIQbaZhic4i3qm6dBNMkBg5DZnbLkVSYcO8AjqSdgCwXGdraidEyESE
         nB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QoEBG3IUvLPkgPYavCJP8mLgD6KQ/3QP6itA+SbBow=;
        b=h12Y2+u/UwxZvIkxGW99JvAlqqFpsqemsPH0KQY1RxUIVE0q0Hi41NqeTjIwyuYaci
         UFGL+R82Gw+aR7a896trHGQR0enPA9gQJjG1tBYQANZ5rL0ayOf9I0hbTi/AIBerAER+
         phZNUQUkHGuC1QU0/kmVfn/DGlf6Q6+Tm0ZOzkygtr9Pu/qD3DIID8/udyzP8y3R1MDy
         KPiIxEil5wU5AM+Pms1Adf5Gtz0bH2mAnD3Cfl+qVhn64Hs81k9AirY1tv5dxEccza6Z
         gbDmqaU8tcbo6WEVcxZiJLANBe56DKL5EvesGed3omY+AcNuWV3yauPhqzhh9g8fRpwC
         q5jg==
X-Gm-Message-State: AFqh2ko81AQnvIT7u54sM+ebkYNDeVpQUpKb9UAMjESHLWELDeWNdnfq
	IjRcfhtUTR+QJ8RS+YoxZntAdsGwXd20EiXQ
X-Google-Smtp-Source: AMrXdXs5T77o659f7M7pUv7gw0/PojZyaj6OwrUQNgMF5J0BDZHbclHOemi/jpFZZKIdSd5uv3F8sw==
X-Received: by 2002:a81:848e:0:b0:4ff:e8f2:4cec with SMTP id u136-20020a81848e000000b004ffe8f24cecmr61328ywf.35.1674180093743;
        Thu, 19 Jan 2023 18:01:33 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id y6-20020a37f606000000b006fef61300fesm8318109qkj.16.2023.01.19.18.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 18:01:33 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] CI: pass --update and --force-checkout to kas in pending-updates job
Date: Thu, 19 Jan 2023 21:01:22 -0500
Message-Id: <167418008361.2034362.15954120964083845151.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230118154123.2936427-1-ross.burton@arm.com>
References: <20230118154123.2936427-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Jan 2023 02:01:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4303

On Wed, 18 Jan 2023 15:41:21 +0000, Ross Burton wrote:
> This job doesn't use the standard helpers, so needs to pass these
> explicitly otherwise it can pick up an old SHA.

Applied, thanks!

[1/3] CI: pass --update and --force-checkout to kas in pending-updates job
      commit: 6b98584ae3cb91e1302aff7c705c5cd3f176e939
[2/3] CI: use 'kas dump' instead of manually catting files
      commit: 513d085a169d84d140220d7167f59ad8b6302662
[3/3] CI: remove obsolete install
      commit: dc36e1de6b3211095bd40db39084f9626aba4675

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

