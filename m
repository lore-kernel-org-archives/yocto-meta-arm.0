Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FA5C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 13:57:02 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web09.8296.1646747820935688314
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 05:57:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=qNfwghOy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id 7so783851qvh.2
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 05:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ffoAvVFiDYZPAwZCIALOPTK04cpAXpExqWOATfdGJ00=;
        b=qNfwghOyWe1kHh7OdrqTMQ+DuKDKw7nNFBLN9H10rvvsmjkAfFMXtmTHxUhWFkz64y
         oBbsrYNgIbooYFXgy5ppirARV3xHc+uytYHRds+TwBNLwphB0gNqF0oYnjF6Ol0+/9xQ
         mlVDy3aquRGLWnHMPyKS3lliVg22x6lgTegFEA7fwf8WkVoM6OhJg1k341k2x0N1ySH2
         o20dzt09R/5Bu2B4OMBYJhFzackebhnrK0ZPy7+f/GSgHaRnmA/2ta/P/YmFNU47/FnW
         nRpD/TAmWHS2CX61BD0PfO6Wh668CRqICdW/3TEkDYLSUeRjpe0VZeu5xUnGhHNFWRA7
         nYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ffoAvVFiDYZPAwZCIALOPTK04cpAXpExqWOATfdGJ00=;
        b=u7ir4LG2Q2G8eSpynXT4tJHrSCVyplzavFv57czhq/HUiTTmlAXmfYBOgVjEkZbV1r
         hKfNbTvY87XvhxacFp/NPnODrATfsSp9p3gBIEt3550vPBam0T1pHliklvHb2ijmaUdh
         NlPFg/djHasOeGkHiVvIaJWem2LDoAuRVo7D80p71swoU1VrXnYvdl33I1OsAGDLNKZe
         tnX03/LSlHFK01Ysdm7OLduofGphcko9jvSNdkDcx1fIPMJnpx8R/6hcvnGXp/2wVWcm
         LzSykmCX+wGKS8PKGGgrm/Wttn8bpxv69kT0cX8204kJRFICh/vGkrImWLjdaqHE7N2y
         9WHw==
X-Gm-Message-State: AOAM530E091SvBjQXEmuzwx4yFfW0BuYeOZGpnk5BuPUFcDX63xPhGnQ
	d1B31teiUN8ssOgJRzV3zo4HV72a7SVhFA==
X-Google-Smtp-Source: 
 ABdhPJwPLu2kL2D2aCtl4Sa6aSPtdHEIWv6XosLR1ihDWTfkz+o7H8kK6R45/3V9HER45XpJ2+2rvg==
X-Received: by 2002:a05:6214:4104:b0:431:d89a:66bd with SMTP id
 kc4-20020a056214410400b00431d89a66bdmr12323768qvb.42.1646747819938;
        Tue, 08 Mar 2022 05:56:59 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:e36c:6a84:e7f7:3230])
        by smtp.gmail.com with ESMTPSA id
 13-20020ac84e8d000000b002e068382bf8sm3824795qtp.63.2022.03.08.05.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 05:56:59 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"harry.moulton@arm.com" <harry.moulton@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH] corstone1000: update meta-arm-image for kirkstone
 support.
Date: Tue,  8 Mar 2022 08:56:36 -0500
Message-Id: <164674779771.2128532.11193256872337848920.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304221626.37807-1-harry.moulton@arm.com>
References: <20220304221626.37807-1-harry.moulton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Mar 2022 13:57:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3130

On Fri, 4 Mar 2022 22:16:26 +0000, harry.moulton@arm.com wrote:
> Update the sha for meta-arm-image in the corstone1000 kas file to
> add support for kirkstone. Without this support corstone1000 does
> not build.

Applied, thanks!

[1/1] corstone1000: update meta-arm-image for kirkstone support.
      commit: 7348f9a76016710063096442b8cdb68fd55206a6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

