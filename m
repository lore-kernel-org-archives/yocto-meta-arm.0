Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C86BC4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 18:45:38 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.26417.1712861137568673129
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 11:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=BxqZcIQz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.171, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dd161eb03afso127203276.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 11:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1712861136; x=1713465936; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHwa5SL47BvzkBnnJj4bH73eetOyQ/AIg9VF/c6x65E=;
        b=BxqZcIQz5JzwPkPYNkzXl34Y6dzyTHLvkEGvOU95fC9aIqyXhlKj00epgeayvgu0pV
         IpjFRzjmttNwUV0a1eOSbv5LyWJMv7j9uht+BxYHh4KNvPEvGhHAzVOZYGHMv2xaNmF7
         SjzPW5+S/y3JbCoEKLQPv8P6Hy+cL6cqEEamQ2cInFqHILkmfW0pXTm2qg/vohoyBxkp
         SroVbJkiae4xKELHv+XWyHAxemEnroVkApJGQE5zDnLhu76N012KVC2Ncgksw4OJRmY3
         n7UvqMi9eXhUwBgprhMUxBDNlbY2RhIFvxSd8Z6b1VrCfaBiEcnk53iw9qalRs2Uklnk
         Fm5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712861136; x=1713465936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHwa5SL47BvzkBnnJj4bH73eetOyQ/AIg9VF/c6x65E=;
        b=aedGaLX0e32zi94y63yeTRBpaWvSOy1lKsi7ftQcJL9ZuEhVrUY1+31Iah5PPS7UwC
         dfBO7QFONQSAVO188spNqUMWFJKM9HiDy5gY0sn2Af8gZwlqWN8afHunZyJXEqyPo3Sy
         hQw7RXQbhhffNUyDGMO6kwRlWkLSwC4U2eRdeFJabKX3kgi+xQEO4o9wk1NEHeTnjuzN
         ql+JQ0k1Qa9DgKVTHepoavAVGpH6Xkte46UzT8gFgmxrxfBi3F0QZRkmzjJd5XtCyGYe
         NFyN8N7iKqvSm1E46cu7btGms4SEThZyagcJyKU6UowFuAYvp1MY6bZzn4pO41A4cu40
         tf0w==
X-Gm-Message-State: AOJu0YyJvUMibEm/S7/T1Q+iZM+OBwp3xiDecKrpeVw5go88qnugo1Ka
	oea2Ybgf2v+/mKEBLwuazxJinDN6+EG5MGC3WXS48B7RGASzsYNyta08pU0jZCWjobFqJsowOSA
	=
X-Google-Smtp-Source: AGHT+IFWpkLc22XV7gS+aWedlBv50QVCjTkRvvGRLW9imohSIvx1qBObi47FqCqcfjkGJcAhqRnnsA==
X-Received: by 2002:a25:6894:0:b0:dcc:3020:e68 with SMTP id d142-20020a256894000000b00dcc30200e68mr295142ybc.64.1712861136544;
        Thu, 11 Apr 2024 11:45:36 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id q26-20020a0c8b1a000000b006993ddfcfc0sm1283726qva.38.2024.04.11.11.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 11:45:36 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	anusmita.duttamazumder@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] arm-bsp/corstone1000: add unique guid for fvp and
Date: Thu, 11 Apr 2024 14:39:06 -0400
Message-Id: <171286075122.2560674.2855762974522776549.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240410150744.53421-1-anusmita.duttamazumder@arm.com>
References: <20240410150744.53421-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 18:45:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5527


On Wed, 10 Apr 2024 16:07:42 +0100, anusmita.duttamazumder@arm.com wrote:
> From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
> 
> These patches set unique GUID for Corstone1000 FVP and
> MPS3
> 
> Anusmita Dutta Mazumder (2):
>   arm-bsp/u-boot:corstone1000: add unique guid for fvp and mps3
>   arm-bsp/tf-m:corstone1000: add unique guid for fvp and mps3
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/u-boot:corstone1000: add unique guid for fvp and mps3
      commit: 5cd5f3442ab0d22728e8ac4d4fb2eeab060ffe49
[2/2] arm-bsp/tf-m:corstone1000: add unique guid for fvp and mps3
      commit: 9a479aed9069569380eb2476b5b9946617d8e4e9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

