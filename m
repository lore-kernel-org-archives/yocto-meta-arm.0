Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A877C71153
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 22:01:03 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.46049.1694383261438303263
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 10 Sep 2023 15:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=idoYwGCx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-770819c1db6so205533685a.2
        for <meta-arm@lists.yoctoproject.org>; Sun, 10 Sep 2023 15:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1694383260; x=1694988060; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6THHeb/zrzd2br6pAAAp0GLTCSFQt+hQ6vVOxm7Wyo=;
        b=idoYwGCx0iytQjlZq55U83f4qku+7UTGVyd5OfIgDVdhkp1VFnwoBQN+UHIfDYl0uz
         4i1eoMD3XrbKiTou2mD6BZ2EBgqZtvEPohQ/ufDINhLFRTXFTEUd5XgSjk2IJ25fyAcX
         fuACGbLA2tMJSBHtcnYuv22bTieebhec0r8VEFECltOOI0gpgfVUHnFSJRpUe38yEmKr
         mI91wENEZmlBLjZykKk5tjoPptGuW5FvWAOqGtPG9vWJxbDpx80XYagRJN7IHAY88N7p
         V2WXY5e2H8o0kb2chSqthWIB2SUsR5NBjblZNU6hiHieGVwsSy8J1oePNVBP+QdqKH16
         9NBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694383260; x=1694988060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6THHeb/zrzd2br6pAAAp0GLTCSFQt+hQ6vVOxm7Wyo=;
        b=iYVZgBMVa+kjcvP9RVwlOE0j7Jz8SUXgGyF3IN/u9Ua+KxrCPGQd6t/DhU+HE79n7Y
         se9gHijrkxXb2HN6B3j2UEHaYZnfkGkpIS+S17rfFeERZllO6fsWD1nIufF3TXO5fMRZ
         UXewJQexDBbEpCAr+3il4JM1V3ivXJ6NBZp791ZA+0LMwB4/HLnyxbEoY5mM1P3y4BPl
         aLmAxGlLHessYflqb3LNuJfIAloxEVP3QwTR82hD/9O2dEVnVpYOMtqPraDCTl7lLrmI
         E0Qx7INnEdZeX3ieBMwNBi55bqwBqvE2meLxZPwXFTul2RBK9zlRAuBp0JVEpwjozit8
         cQ8w==
X-Gm-Message-State: AOJu0Yy/eX4vZPXWWkE7H2bCVWy6NFmQ7AoPMUssRoPVP46vMKsypinx
	o/eAFb0zV8oTzfmjFZyPep35KT7Quv6NmQjxnWU=
X-Google-Smtp-Source: AGHT+IGgJAya+4U7Ei8Dtbo6eP69z6n01+faBSuGLdjj6U3NmsBCfqMVXHI4YO/nVIwYsaQrINnGlg==
X-Received: by 2002:a05:620a:20d8:b0:76f:1f8c:cc1b with SMTP id f24-20020a05620a20d800b0076f1f8ccc1bmr7316312qka.78.1694383259989;
        Sun, 10 Sep 2023 15:00:59 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id e18-20020a05620a12d200b007708082cdfdsm2103040qkl.123.2023.09.10.15.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 15:00:59 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Javier Tia <javier.tia@linaro.org>
Subject: Re: [PATCH] optee-client: Add path condition to tee-supplicant.service
Date: Sun, 10 Sep 2023 17:59:49 -0400
Message-Id: <169438319106.34322.10789022983542378191.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230908163222.2513036-1-javier.tia@linaro.org>
References: <20230908163222.2513036-1-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 10 Sep 2023 22:01:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5027


On Fri, 08 Sep 2023 10:32:22 -0600, Javier Tia wrote:
> Without /dev/teepriv[0-9]*, tee-supplicant.service will fail. Prevent
> a failure with a condition to check if /dev/teepriv[0-9]* path exists.
> 
> 

Applied, thanks!

[1/1] optee-client: Add path condition to tee-supplicant.service
      commit: f02d065dcef0bb29b3a1dc7b814a6ffd5389440c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

