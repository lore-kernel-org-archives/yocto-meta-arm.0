Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E57C433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 16:38:39 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.160.1664815110848992104
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 09:38:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=2BS8hWoz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id g9so3406823qvo.12
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 09:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lQUSnSJuKiq6Gg5aXkTrtcsq7M0mtmWTVtZOEL2LXr0=;
        b=2BS8hWoz6H23H5MTNpyO+REl2G0Gx3nT4/a79NKojYyshBFPmkcQyyf1/dNGgWSFQi
         lpaSUakWGvsZwG9hrDw98+SWLI6OD5D/OO4boSkLsLVSSf5vVAFTvDkMZiGc86diX9Zi
         f5yb8M/3+r2nGsWqxt4L+P8zcIkoIw6qOtEzdpdwatr8VwsJLt+i8dC9UnsuXHX2uRSQ
         odygRkC9uoN8dRCHXdwQyy0zluiiJiaBUMRKU791dSlsbPB1bzfRXwj+uwy1wc6wtjIj
         PKQL20niEGBR5Hkfh3ui/7IkrWfLTzVrQ0xB4u2VyzRu6K72BWBK0Bb/d8qa8ObV6cxW
         NNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lQUSnSJuKiq6Gg5aXkTrtcsq7M0mtmWTVtZOEL2LXr0=;
        b=pEsv+4QLB0mnbiXGMMUEwrDFELPD9jkxPC58MO+KEKTXeMkwXJEhgoMswsNdomrsQy
         qFxZsTCXvT6jmxO+v8pd8+6XKzb4oBe/oLZfoIjYF6IHMZERgnHh7wDUVaGIQTRctc3H
         kOnO7gatTt+HTTCiWI1TBiIDEsaafHzvKxzeFvRE67NfSwnmPAH0p29vnRBXnjlQiQQK
         XxoxMhg7A6+Tl8QfNYxP09+tKO9ZOY+/Y1pfNgeK6r7+0r82p0AWrSGkIfFF+95I4DRH
         EpYKn7/1yV2teFVV3EO4CPWy2MzXIfmrb6S03CQLKhL6HdjbFnhVD8Usk7NGY/MNFG9S
         rnZA==
X-Gm-Message-State: ACrzQf146dgV7d2VN/cjbRIrzUFK59rMj/KM78Zs8cZbASU0XLVPUAAL
	7RUvk/CgZg+LstCCpf4MLSIaWv+na540TQ==
X-Google-Smtp-Source: 
 AMsMyM4B9cFAOxtuMmSaskenlwYs+iuGC09CRIxyBgUB96yuAvimHbYRLHycrCsS4JAozCPhLfcnrA==
X-Received: by 2002:a05:6214:5005:b0:4af:b6ef:eee2 with SMTP id
 jo5-20020a056214500500b004afb6efeee2mr14046027qvb.75.1664815109481;
        Mon, 03 Oct 2022 09:38:29 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 m13-20020a05620a24cd00b006cec8001bf4sm12378169qkn.26.2022.10.03.09.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 09:38:28 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"adam.johnston@arm.com" <adam.johnston@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/3] arm-bsp/n1sdp: Update EDK2 and TF-A for N1SDP
Date: Mon,  3 Oct 2022 12:37:43 -0400
Message-Id: <166481506585.1286959.15165517944505621177.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220926103203.1196752-1-adam.johnston@arm.com>
References: <20220926103203.1196752-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 16:38:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3908

On Mon, 26 Sep 2022 11:32:00 +0100, adam.johnston@arm.com wrote:
> Updates edk2, edk2-platforms to align with N1SDP-2022.06.22 release.
> Updates trusted-firmware-a version to align with the N1SDP refresh.
> Changes in trusted-firmware and edk2-platforms are co-dependent so have
> been submitted together.
> 
> Note: The EDK2 patches contain CRLF line endings which must be preserved
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/edk2-firmware: Update edk2/edk2-platforms versions for N1SDP
      commit: d7ef05a2fead4db55abbe77cfe5f44317ead2f6a
[2/3] arm-bsp/edk2-firmware: Add edk2-platforms patches for N1SDP
      commit: 4f6a200997f6c04eab8d733b1d9d64d149797139
[3/3] arm-bsp/trusted-firmware-a: Update TF-A version for N1SDP
      commit: 7f05bd643123b98aa4866eb0a74bcee94a34304f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

