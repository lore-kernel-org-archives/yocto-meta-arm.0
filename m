Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18855D2F7EE
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 06:10:33 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.42378.1729145424249064671
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 16 Oct 2024 23:10:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SXXGDhVz;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f8490856so630346e87.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 16 Oct 2024 23:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729145422; x=1729750222; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m9oPoUWsBtg7uMfTGWZaY/wxZ+zPRrDcn0yYxMFyU+0=;
        b=SXXGDhVzYupIrr5ew8IK2L+W6GDoLBrZYv4j83aZ5POCZ+q7h916OpjLBa8bk/gnqU
         BmmA38ScRyV+KBxIL0LivHjCmsdwp7LNQO8fA4u3K0RNd1pdKjuVqFpK5EqwE3dkYGaI
         shJaSuBpk9FTG2G2iIqXYWTh3R39RSnmqY3pkUSNWkzfOUeEsIfduTD5xTwBKcmrfYw7
         dO1YW158dqe985Cp+Awu076UzoOrzRgCSXrCI5TOL3HhTVpU74UE+a653vixgCiMJ3Sf
         LIqOaFtqZK1llUtVo99TvkHFGePIch7ZX2RJrVSQZiWg4O0NJwoaPvt1hhP9+7xBmZhB
         Fr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729145422; x=1729750222;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9oPoUWsBtg7uMfTGWZaY/wxZ+zPRrDcn0yYxMFyU+0=;
        b=E4hSfkmlV3H/3Y3OakKs98ad0gQ7agcp9VfAVh5lC8/Ro8pGJoKrI1ubeKgt9FLHAg
         VSPxnm9BlGTox0jcLlZYFzydeopLMHV60KvSqRRak6I8fLQe2tXjZaeQ3DQPw/Xek2uM
         dbUP0+BDbXJtdNqJqbGWp+BnBFLg+Rg2mbFaiFVlXxsD/nKbJLV24wlD2fiGD62c1vmV
         DbwCiI6W/PBHJIs1u/0HyzWUYQ4+x8pDIkiM+bnLpnKBFMm4hsHbR1wM5We9JuLqipQO
         CBMw4Kp5/lEj12Iq/irJ6ZJmVkgBsqgE71dGZFYvtWeeXl0yHBIiZBgmUNJp6WW5Sfqx
         9pMg==
X-Gm-Message-State: AOJu0YwrsLUK7/K3gpkwSzQXJFkKu/ZyNkejTRoaxPEJ9aG28iZ3uObi
	Fq03aCrQuyy9+kxW09s/4iKvJIecAtjlyeRlaqsam2rCXO99cMnEeuVDyi0H+ek=
X-Google-Smtp-Source: AGHT+IFsFyEkm77vyZdqiTdRJhkWi60UJxetHLdrBxrUUAxrGtJS2y98ceSDMFR/g40uSegT5qkyJQ==
X-Received: by 2002:a05:6512:6606:b0:539:dc87:fd3a with SMTP id 2adb3069b0e04-539dc87ff49mr8359747e87.6.1729145421982;
        Wed, 16 Oct 2024 23:10:21 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa8e62sm659096e87.39.2024.10.16.23.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 23:10:19 -0700 (PDT)
Date: Thu, 17 Oct 2024 09:10:16 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org, tom.hochstein@nxp.com,
	sahil.malhotra@nxp.com
Subject: Re: [PATCH v2] optee-client: use udev rule and systemd service from
 upstream
Message-ID: <ZxCqSAU0NpVmeTdD@nuoska>
References: <20241015133512.96327-1-mikko.rapeli@linaro.org>
 <Zw_95caMCjfsPsEd@kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zw_95caMCjfsPsEd@kudzu.us>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Oct 2024 06:10:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6202

Hi,

On Wed, Oct 16, 2024 at 01:54:45PM -0400, Jon Mason wrote:
> On Tue, Oct 15, 2024 at 04:35:12PM +0300, Mikko Rapeli wrote:
> > Use backported upstream patch for udev rule and systemd service file.
> > sysvinit script is still used from meta-arm. Don't install systemd
> > service without systemd distro feature, other way round for
> > sysvinit script.
> > 
> > tee-supplicant started by systemd service runs as non-root teesuppl
> > user with teepriv group. sysvinit still runs as root since busybox
> > start-stop-daemon doesn't support -g group parameter and -u teesuppl
> > doesn't seem to change the effective user.
> > 
> > udev rules allow non-root /dev/tee* access from tee and
> > /dev/teepriv* access from teepriv groups.
> > 
> > Tested sysvinit changes with:
> > 
> > $ kas build ci/qemuarm64-secureboot.yml:ci/poky.yml:ci/testimage.yml
> > 
> > and systemd changes with:
> > 
> > $ kas build ci/qemuarm64-secureboot.yml:ci/poky.yml:ci/testimage.yml:ci/uefi-secureboot.yml
> 
> While this testcase works, the following does not:
> $ kas build ci/qemuarm64-secureboot.yml:ci/qemuarm64-secureboot-ts.yml:ci/uefi-secureboot.yml:ci/testimage.yml
> 
> https://gitlab.com/jonmason00/meta-arm/-/jobs/8091040284

Sorry, I missed this configuration and the additional tee udev rule in
meta-arm/recipes-security/trusted-services/libts/tee-udev.rules
and group settings in meta-arm/recipes-security/trusted-services/libts_git.bb

Will send a v3 with fixes.

Cheers,

-Mikko

