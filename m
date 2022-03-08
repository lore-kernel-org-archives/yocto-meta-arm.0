Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CC0C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 22:53:23 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.637.1646780001793806621
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 14:53:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=mY/NSZL5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id j5so630718qvs.13
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 14:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I4T+1JaaWw8WtoXCB47B5rErhOhZBXk6OZAgQjd59Ns=;
        b=mY/NSZL5bvzoLLdNgxLYPck7VM6OrWwGSWXDbYyae7Sdm3Bi8Rp1/009QeFn5+m2kT
         fxB6BhJMTIQwC14IOrO1nxvUzk3sz0ML3miIXOSBDsOa3nim3sDCnAdZ2r2NJTau9DSs
         GckWrphnFelcoDgUUPBSZM/nyT05cK14itvAUvI8hik/QjCrn/Dg00vL1M5mLx4+WVVi
         cE5mbsyYOoZP+q1JHROrgvY1Aiz1eOtOqTim5LPz2yB6/jGO9cZVXnwY044rE/WpY0gC
         oy6cehXgZTkqV1l+dszEtHM7H96vviaQQhcUx43fMTmlqzop4NzVKbNAX9JrP+G8Jwhy
         izMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I4T+1JaaWw8WtoXCB47B5rErhOhZBXk6OZAgQjd59Ns=;
        b=LCyi5EoOBiCkawgQqX13jgD42yZtEuNc4560O3LP0Bm+U35195dLp5xY+7EVnt8hbE
         dH6YO819XBCBE2ssnOYlh5CINzEllhwkDXt+Ix//RYUq3azabMmUk37v7yXas+D44gjx
         BEFv1Ljg5r6kp62/SxR86LW4s95cMlbHo+Z3Pr3Y/hjzEke6YgNudn7nMA4Yd+r1If4N
         L5qs6/KXpZDcOYk0I+9Hm6t1FAE9y0OgpiI6wa1fteycqjmOcgFjMEZa8v3mtXEvz2Qi
         Z/t2g9r9qtGiO+CqWofTu/U3gJaKScre5KxtfxwwFhNQ6SYhErgwQ/3MMtUUlCsi7Qqx
         nPjA==
X-Gm-Message-State: AOAM532Kdr/a5eo2lKHDid63u/FlzPOjwjQY4li5GpPf8RPq+kfzJnUX
	lUgELCnrkYVqo74OVB6uvF9tAW+Q/ybYhFKj
X-Google-Smtp-Source: 
 ABdhPJyX39sV5EJlK1QtD+K95+26AdHDwOVsTbz3RDVEMsjv523VcLjaDm33cz9k8xoDLqfJ71zIhw==
X-Received: by 2002:a05:6214:c29:b0:435:9a81:c4ab with SMTP id
 a9-20020a0562140c2900b004359a81c4abmr7765800qvd.48.1646780000753;
        Tue, 08 Mar 2022 14:53:20 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:3ca7:c4b3:8bcc:39e7])
        by smtp.gmail.com with ESMTPSA id
 k8-20020a05620a138800b00679fc7566fcsm135856qki.18.2022.03.08.14.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 14:53:20 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"harry.moulton@arm.com" <harry.moulton@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH honister] corstone1000: backport: update meta-arm-image
 for kirkstone support
Date: Tue,  8 Mar 2022 17:53:01 -0500
Message-Id: <164677998158.3748518.1570765291856000986.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308161717.900575-1-harry.moulton@arm.com>
References: <20220308161717.900575-1-harry.moulton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Mar 2022 22:53:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3137

On Tue, 8 Mar 2022 16:17:17 +0000, harry.moulton@arm.com wrote:
> Backport patch from master to update the sha for meta-arm-image in
> the corstone1000 kas file to add support for kirkstone.

Applied, thanks!

[1/1] corstone1000: backport: update meta-arm-image for kirkstone support
      commit: ed0e6cb0d3ae4090ead9313a4093fedbb6b4e603

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

