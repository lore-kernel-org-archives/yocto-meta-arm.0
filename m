Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B32E78490
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 20:19:07 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.67355.1696191546279017971
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 01 Oct 2023 13:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=eo4VZnwk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4181e268447so68253091cf.1
        for <meta-arm@lists.yoctoproject.org>; Sun, 01 Oct 2023 13:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1696191545; x=1696796345; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xeD3DAifeplCkHZGEGaxSpYSy+h8l7ImAHx+BbAKIY=;
        b=eo4VZnwkIYCUbd9XPGN7eyGMWkbE4dujnEOs0PPZ08VfF1OKVbcyT7ZmzsaMDDrKvR
         BBENgB5FtT9vUy69pJAeYWq3wtfuu0/BcXDkeADDxVz46qPb5i6t3DryNY1HNU7DUBk4
         qj8rCn1aVAoBa1hIfgEcohyclN1+tPN+uokamQKCCt/aCuIpSXh5Ad8wA/CX3kNkE8FY
         8kbfXcZaQtCta+hwtN/68JYk5olGRpF/HTBjujcRvHKil7HT9ncrBcwkqah94AE+NHBT
         L4nVjehRR5pQJ8vPr1q2czA65zKJ6l7f3JNpBx/ClYQU6LnzNVT6gflRkElTu1Gxc/Ky
         IWqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696191545; x=1696796345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xeD3DAifeplCkHZGEGaxSpYSy+h8l7ImAHx+BbAKIY=;
        b=H8+TuYsFWVazwaFe9NCpghk6gEWfK5xTv/JJm8YLqX8BmKuf8RB72rTFw0Rg0/TCPt
         aEXrk6vRuqNkQVkojKq2eiCQGg/wf5RGs4cCZtz2Fx1p/5t5aKuw26Gg7sFuANYUVXjr
         3WZM10Rxm5y4SAunfYrXIlOWkgwFAEBr/FdAzMAVcuOnuoETod4XlqhEedlhygGiS0oR
         PVD8RS7VvTQ8KVRGJRcsj1ylG7+YcHN3NbmoZm/7WDwQHfBz3YHdk8CeKThZsrEZaUwO
         LImCeiH151n140/BA6DvRajePqVU5twHPE0cHJSrXiUPtQkeRBdyGSOnyVHSDc8Yp6VP
         nffA==
X-Gm-Message-State: AOJu0Yz+QY+hkx/oTfrPYk0o/q0cHDWp14CJUdE23PFkfaJNLVU1hDoq
	Ao1mBGIuJQrI785sBU4dnpqso8s8hFUixaU/eI4=
X-Google-Smtp-Source: AGHT+IHLY0foM6i4X3qVhVXZkF5RvMaXLYttt8+n2KwDejqAckrAGkXn5VnalgbMZ1vAdPvNcn+d8A==
X-Received: by 2002:a05:622a:291:b0:419:5721:de48 with SMTP id z17-20020a05622a029100b004195721de48mr12425230qtw.37.1696191544900;
        Sun, 01 Oct 2023 13:19:04 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id r23-20020ac87957000000b004198d026be6sm973116qtt.35.2023.10.01.13.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 13:19:04 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] README: remove reference to meta-arm-autonomy
Date: Sun,  1 Oct 2023 16:15:21 -0400
Message-Id: <169619132218.3169419.8809847750316890439.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230928183628.3839203-1-jon.mason@arm.com>
References: <20230928183628.3839203-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 01 Oct 2023 20:19:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5094


On Thu, 28 Sep 2023 13:36:28 -0500, Jon Mason wrote:
> 


Applied, thanks!

[1/1] README: remove reference to meta-arm-autonomy
      commit: 32e06a23280b6e019de59eed4765d280e7b72bc6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

