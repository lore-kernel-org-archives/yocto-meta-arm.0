Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2B3C31D97
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 02:51:33 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.41726.1719975089625152219
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jul 2024 19:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=06sNRiQk;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.173, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6519528f44fso741097b3.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 02 Jul 2024 19:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1719975088; x=1720579888; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lP5uKo1y0dViyEw0ERcS7Z8hICbqM6OuQTA96fMzRAg=;
        b=06sNRiQkX9B5Exv8unfwFdSnhTDV+TFJdATZMJQ6O/0M73AYRxYMmGuv3mpOD8T/iB
         zNFy7HNj7FMjWivzoTjObGltwS7/w4FsCjAv2KfigW7eTYHn6O4XfJhGyEmdlxM+G+nm
         ka5DwhftTz/jTWSe/Jm1lCIWqohMwRDd2QlSHb+NZkBdKXBAJHFWG1GgnKBFmKCk9Ue8
         0OxMtWOOGcK5CY7GcdxKAHHxX76jw/g0z23LgupXjP+s5K1b6OCZfV0GmZEi+8z5slwU
         QbC8gg/ZiaYS+YhsCWu82wuoGStJ3Hw2vjxNPHjyDuAMbMpUD06sNCI6RI0VI9CBtwyb
         9hDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719975088; x=1720579888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lP5uKo1y0dViyEw0ERcS7Z8hICbqM6OuQTA96fMzRAg=;
        b=K65eqeL7L5kF/q/7WkCv7c/BQ1f6+agAplvgnIrJezCOCXN6OZ3wcvDvoqE8OuWAhL
         gpas2CK4v7cFGv7SX1fjUYYNBhUB6GlkL7/OczO8o4BcGc0K0iIlOIZn2zTKRCjI4JBY
         Ao0Pv4BSzuhBkAmpv2xagajKlsr6lUqfOsoeKr9FAF3j23KPAZIaK8LwQQ1M9jXu6+t1
         fn+oALVBFF9QDq4K/AWc/AxQtz3gvKoaHsjF8dYvGNmS4BoUl5WSnFw8tjWj8S7aix9O
         1FCBKe0Qs9XRTzCJdV8PcaEQ4AqiIGBuFlX620TjHHFTmzUILFOtDhub0vXgmYcjV7SU
         u4Ow==
X-Gm-Message-State: AOJu0Yy6HsG8lhXGm39DlbsRkdrczuFmuG7PKzU+jyl5PE7vfxkfSFnI
	VzIEcraJeszCzTv6qyuokcZlakXiahpHoaAyicpQ90LXrnYBPnw9IrX79GSRzAwa2rKYHBcOWMM
	=
X-Google-Smtp-Source: AGHT+IHBIRmVZ5dSU8vuGQ8y86aHY1RoJdQ2axJ+GfkSGwmA86i0/yGeydLK2gJcx5UrixKKY8lqTg==
X-Received: by 2002:a05:690c:24d:b0:64b:69f0:f900 with SMTP id 00721157ae682-64c71cd9d81mr102507837b3.23.1719975088373;
        Tue, 02 Jul 2024 19:51:28 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9bb502e6sm20072827b3.77.2024.07.02.19.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 19:51:27 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	harsimransingh.tungal@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/trusted-firmware-a: corstone1000: fix compilation issue for FVP multicore
Date: Tue,  2 Jul 2024 22:51:20 -0400
Message-Id: <171997508121.587178.6320134119099563117.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240702153529.19530-1-harsimransingh.tungal@arm.com>
References: <20240702153529.19530-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 03 Jul 2024 02:51:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5861


On Tue, 02 Jul 2024 16:35:28 +0100, harsimransingh.tungal@arm.com wrote:
> From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
> 
> Include platform header file in order to remove compiler warnings.
> Due to GCC upgrades to 14.1, some warnings are being treated as errors.
> This change resolves TF-A compilation issue when FVP multicore
> is enabled.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-a: corstone1000: fix compilation issue for FVP multicore
      commit: b5903ce6ea89ebec8e9cdb799cef0e955c0ef6fe

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

