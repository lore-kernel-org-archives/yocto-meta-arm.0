Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255DB10A3D96
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 01:48:39 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64273.1774576118368921565
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 18:48:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=1wQTbaz+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5094e1d17d3so15779971cf.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 26 Mar 2026 18:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1774576117; x=1775180917; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3auQ6/+VWe5i1PzCsYceYYbC0YUmKLgrZ1qDGe5PyQo=;
        b=1wQTbaz+MlaXNDn9GJ2yWXgbIE2QXmE/IYVgtW8AVB5T5fvipAmugve6EQT94NWpwo
         0GQKtP0gNu6QM04ehNiC2/FBjND6msJg5o8tCuqJlT2jR7lIkZfXH6FjVor11DprtGD1
         BQfCWAhqXXHG+gnJw3/Qd6XLQ4NqwvLlpic0cRPR5oRrcpQpc90vnsdBYnLQJj7xyzBo
         4obZNnHizWya3btDe1bQhgGAKIfeF+EazWfM/Q2TTzhAysdny+SQnds3l7VN9pq4NKN9
         HQHOp5YsBzzNqGeupkitm9foFdl2a/SteiIlw1oJ59LbDNVilMWfccfJ2LndjRH+UTY6
         BSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774576117; x=1775180917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3auQ6/+VWe5i1PzCsYceYYbC0YUmKLgrZ1qDGe5PyQo=;
        b=pu/pXOMkAd72JPwLWiJwJVTmYNmqtbgVkNz9mC1DklWOj1EOAWv0NwW6Fg1zcgC2eb
         hEFflK+OTX2u3VrO54lkPY7HUlUb+I4MmLTdVwnVfOY+RvKYr7Ma8bn0NcvyPZh3Nhhy
         fSJbh3Y36U/FZKZhFP1LxW14STMgUYQ+Nd0lvStrexcSvvxTIEI7dPBNm3UKHCIUknWd
         LonED8OgaTqekO86YrLk1gY4QK2npGRZH8WOJJ3r309VIRqgXbEFoycHSLO3wYTYouts
         PVFYDZc1DqoiRXfG7OXNFWmxJK4+3qruryTCa9m88r1sKmEQKE/nk5PlIb/zcJttLGlQ
         TkkQ==
X-Gm-Message-State: AOJu0YyAN03Oj26oRkpo8u4ML0P8tWOVNqWATVIq0juG/Q2kpQVDIhXP
	m2lb9yTPVKipIfF517Hm7Nv54enPNAx8zVXALZVNsNm5LSyqTelyEKDD3BKA4wXYUDYbcRFsfUZ
	3wD0=
X-Gm-Gg: ATEYQzyEPfnimB86muyN9mo0wIj6Ppf15ovYqp9t+VUloS+llWqU8oAUpPp+B/s0x0T
	baD1xRrivSXryLBk43IvIBZf4+w4GZ+is0VjunMaDmUI/Tvoec4mqkXDxcPqWfrrcPpyNbKPVKd
	pKv/4v7r9THC4Bj5NAMrawVr16q5RIUv3lQEWan+qF4x6WQml/YKoKPswvEqiXHuMFiY+4rk03R
	2NAKn4Ey5bFWhyZCogBfYEUZkGe12FEA9i5ipgkKsg4L8bWH6QpCifRp1TzlnxyDmqW6hmUcfCa
	xCAKyw/k/mqDNtcOCA8A9xM7QZooICr2Wh0sSH2fV6oIBSjYDIhpZglNHrijGOfBq8UXgvq3iCL
	hm+WcQmG5vbM/Va5CtXlfg4UcozKyuPst5TOhKmL3GrCuv8oSMPr85WfD9Wo2rXC15Mht8DBTV4
	t1EAdsB7MBjvUdUhITkSGiCdg=
X-Received: by 2002:a05:622a:20a:b0:50b:3788:ab58 with SMTP id d75a77b69052e-50ba384cd3fmr11226061cf.17.1774576117196;
        Thu, 26 Mar 2026 18:48:37 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b923a7a82sm38834901cf.25.2026.03.26.18.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 18:48:36 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/scp-firmware: add git recipe
Date: Thu, 26 Mar 2026 21:48:21 -0400
Message-Id: <177457610090.1782542.16339224196086982291.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260325180639.88517-1-jon.mason@arm.com>
References: <20260325180639.88517-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Mar 2026 01:48:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6978


On Wed, 25 Mar 2026 14:06:38 -0400, Jon Mason wrote:
> Split off the main portion of the SCP firmware recipe into an include
> file and create a git versioned recipe.  This allows for building and
> testing the latest sources.
> 
> 

Applied, thanks!

[1/2] arm/scp-firmware: add git recipe
      commit: eb14d855e9d7a9c218593ed1ff2e9a0d065d5e35
[2/2] arm/optee: add UPSTREAM_CHECK_COMMITS for git recipes
      commit: 7b687574a155f73de77488504261febe54c20cd5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

