Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB89C636D4
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 04:31:21 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.255.1676608276359414894
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 20:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=RBCTyM/K;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id h24so4417793qtr.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 20:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wOfHGtvL7BVstwU5oCdqeh87cAaYNnWDoWWft6RljI=;
        b=RBCTyM/KpazWk7Jj13W0QRSTUqDtSlzzh0Zt1nrOwfa2rW3FQi9WglwzQmU+nqQUzh
         MlSDLb6CfzkrYWW9xOUtvyzcGZe+aEhnBFCIn2uLxAtI2yGqmbkPpaKk49VkWvrEc6Wm
         tzgjg4rrZioGxDocbeaJltZVhURAgHNVc5chMDrggmUKkxy3Gn11wCBcznHD8vF93hJD
         C/8gnGMkHizMzJ/k4CHIPRtblxgCt6Xms38hPg9R3eI8To8993uqbJB2nnDvLeXUSfZz
         uAFaEB2+cZAPic8GlaPYnuXWV6XBWrC9i2KUgWTe9iqqYubq6vfPZJSZeVoH6PdJ3obv
         gYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0wOfHGtvL7BVstwU5oCdqeh87cAaYNnWDoWWft6RljI=;
        b=OM37SGFQJxEMZDIdrgJ7fI7LNfxmp3NYAF5AY7N/J/M4p4fd+wQuyHDYGUCiVwM2zf
         rX2E3111Zp63heG4DX0Z/GymT8+HDNGu3nkkg3gU3rVZta93vGbpVbEVAns+IYm1l3as
         GPTTT3n1GNzkHWqoWAh278FQNEtox7DJ2qasIC2eyyMAabzXmxs8HJfV+oRx6NZtfTdq
         IfdAoHyk142xKQazqN1UHdxOhPU4V2+t6IoqJ88qwQY2Hkgv/hyWeLoyVziBwMx6OvVG
         INZMzEWVHz80IKq+a7RhHfwExHUiUNcM8ZjciJ/EtpOfaWiFi3qGiayhlB5jhrQtmIWS
         Us8Q==
X-Gm-Message-State: AO0yUKVrnYTxF66qi5ya/7ueqkVDu5OqLW//luhiknF40qcw+d/icMzE
	KNlGA5+fzbPgLLo/s/sBkIy+UbtfwbKQqyMr
X-Google-Smtp-Source: AK7set/E3E6UsJGcaj/pWpiwW9/1PjzR0OwdOp9ousmeyldjRAq+d8Y9IWXBnW0RGHX1aFzG5QEz6w==
X-Received: by 2002:a05:622a:1212:b0:3b9:e3fc:5689 with SMTP id y18-20020a05622a121200b003b9e3fc5689mr13465980qtx.58.1676608274922;
        Thu, 16 Feb 2023 20:31:14 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id q123-20020a378e81000000b0073b706281b0sm2556501qkd.125.2023.02.16.20.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 20:31:14 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH langdale 0/1] arm/trusted-firmware-m: Do not use release branches
Date: Thu, 16 Feb 2023 23:30:49 -0500
Message-Id: <167660825902.685488.444765851099750057.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230209120456.26364-1-emekcan.aras@arm.com>
References: <20230209120456.26364-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 Feb 2023 04:31:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4412

On Thu, 9 Feb 2023 12:04:55 +0000, emekcan.aras@arm.com wrote:
> TFM repos do not use release branches. TFM-test repo does not use master
> branch and use detached head for the 1.6 release. This commits makes necessary
> changes to be able to build tfm and tfm-test again for langdale.
> 
> Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
> 
> Emekcan Aras (1):
>   arm/trusted-firmware-m: Do not use release branches
> 
> [...]

Applied, thanks!

[1/1] arm/trusted-firmware-m: Do not use release branches
      commit: 79b44a4d32bc19eda2b3dec5750a818959097cd6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

