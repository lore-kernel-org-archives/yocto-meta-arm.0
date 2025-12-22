Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F84FE6780A
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 17:12:43 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.84434.1766423560274995397
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Dec 2025 09:12:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=s+n3n/0u;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4f1b1948ffaso27270381cf.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 22 Dec 2025 09:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1766423559; x=1767028359; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hm7L6V3K+SVE//zDfLfgb6DseaRnafwsXHi25/VEnpE=;
        b=s+n3n/0uPe3GGDexRNTz0MRoGjs1DGlQC1gsGyy+gqs/s640mHEVrUnN3iwP07Tjl0
         Y0zGPApK1cT0vNALcOUJkTM5W1Uzs94rA2xxHWJTuxMJezWmFcFJWSWMBBtI2vsjjWCP
         Gx+OQUY1aBTmy/4AW9asrfbzYvwRBQ2H9hBdITdxGpgsRXXfthRYBejkW26ZgJqi/jIC
         UQoiqblNtopGKd2zSNrZZEjp4uS1eAfMchVeGEXY+z1E274VNqPTQVuMP82sWWbotP3k
         SA/Fh0SrOWHpS32E8akPQFp2RrXMFlyX3sb6iYTW1j7fn+HDLXhc9E1jBoZpbp1ivutg
         ij1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766423559; x=1767028359;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hm7L6V3K+SVE//zDfLfgb6DseaRnafwsXHi25/VEnpE=;
        b=DI0XlGN1Lywzq7d85mt7S9WcW+tkYGqCvTFME3nlir5l2fC3mg/q2IZVgu3n8Gg7wD
         dsbxwsXMclK5KEO9/ZomKIFVKbKfkjODHspD+bPrZOJJfgeZMFBpLjxH8nUb1w7pLQ0C
         13qyCJC/DPwNxNgmJFxiNHcJcyrAO6XjruBmvlCxvm/AK1BRL+m++R1TjU3Igq6BLdRo
         3/Y/ZxHMGFK4L+pBjWdSK7sl9friF5U1BRdnAOqF/BFBiPJ5dDGw8O8zphMQY5bgPz0T
         ro6yElmQs84ryjk5mFXxxcuHxj7K1P4AMlTc5jnppJjtFTLxDMOxBUMmgO0TM0h/YFuc
         geHg==
X-Gm-Message-State: AOJu0Ywkl1BLFvBBLikBlBw505EDWrzt84WIeDZoQHw+vjNz/huatRyH
	dcmaZ1X6vqL7U/hnpZUhWwVqiM5t4utT407OLsJLIBOWiXmhDGJFd9ai78h73xsPozRdLhX4ZsI
	WkrY=
X-Gm-Gg: AY/fxX4oZrtGr5R+QnX0qp/5muvLAzpi7bAmp2G7jYjjzRQoNwWqmfSeqbJpFP6XP0e
	4Orx0rWFxPxC78NjzXDcXDxGqUbPVVlaD5IK1Bn0R+lC7iYKycgw4+AUESwLt9mFrUxBNR9hcSL
	nFtxw90f16t9SzdRktwhMVeMCtnK3B2DeeQxA7/JZa4g8ioaofoCD6faOPz13aciPbtqyx2vS31
	7x7ZAZSM4xG4oTO4bpD+ancb1s4zXtAhA9p9g77wtEY+Bfx6g6LPkkbgj3/g3SYKZMyqoQOU+KI
	lSHVTQ3aQcUoZWdxDdslrLmevp/zVgRhbU9xcmXmNiOqpDOd6PzwJoCw5H/zpvvMGpCExFqt0fs
	wS0jPRNq9Nb+yUEv5AswN7Xjn4RAs4TKVFij8x0eFVKPPLRg3PTalw5DAUfdgBV+fCGoaDlGDlO
	z75w==
X-Google-Smtp-Source: AGHT+IFjoiUJicy0qrSnj66LOMNND8SvwKPeIiXo0ywTOpjikljqaLnzIJduAq2LSoO4jz0SBcvPvw==
X-Received: by 2002:ac8:5ac2:0:b0:4ee:4a1a:8242 with SMTP id d75a77b69052e-4f4abdbf8famr163290291cf.73.1766423559078;
        Mon, 22 Dec 2025 09:12:39 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4ac530f0dsm80383251cf.3.2025.12.22.09.12.38
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 09:12:38 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Mon, 22 Dec 2025 12:12:38 -0500
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm kirkstone update
Message-ID: <aUl8BjejzH7C-Hfa@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Dec 2025 17:12:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6810

meta-arm has released an updated kirkstone support tag, 4.0.7.  The tag 
contains 7 patches from between 27 Jun 2025 and 05 Nov 2025.

Per an external request, we have duplicated all existing "numbers only" 
tags (i.e., 4.0.7) with a yocto-x.y.z tag (i.e., yocto-4.0.7).

Thanks,
Jon

