Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC855C9EC96
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 14:40:03 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34103.1768228800705415152
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 06:40:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=d5/RhvNy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4eddfb8c7f5so62695771cf.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 12 Jan 2026 06:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1768228799; x=1768833599; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wkrLti9ACclRJeUjaKdnUwA7leNnok9VNelAm3SkN8I=;
        b=d5/RhvNywRYbKtY987T+urMu2qH/6ao/Vs0hLUkW1hj9NVPMBHNjDp0DImYY5Qt2W/
         yrrDiohlmJuaZQT1aYXWOshIs+QWlRjHl6SBGpLOS520gPwfRvuoypN2lSriDC5p1zKv
         689mIwYHVKDMMQBJNLY9aMVy1OzCbrKVv28a76zErXQQ9C/CShfBfaMie5bJydKrSQan
         Xh9JD1uZZKlf1dq1IlKSvpTVJ1KVqCmkRe8soJ4RSTcbd1cS3EFgNSS7h1BcOUmEYt4K
         koMWABkFNlGZ7IC3t1ZwI+rWpMGOBjIdoyIBZOjXo+zPS8Dx8udGthKGrOPVNXiRKzqX
         Qhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768228799; x=1768833599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wkrLti9ACclRJeUjaKdnUwA7leNnok9VNelAm3SkN8I=;
        b=WTh9+LXk/YKefuUZkT7VDKlAMChJ+D/H03c8bxzMvXec9GDbU2V12IhueeI5/yAXVu
         u2hbWGpNfpRuT9Qgm7s9tAX7QNxsJuSYxbhhAn5jjp0/bY2aabWYnCtYXe5TzH5JjNFH
         yMT26J9ZRNO0w2r0rWJa6zfFN6TqUl6I13DZ2qDwiwpP6soDxNez47BSuXOLBmFIcCJY
         JkkcSP09mbJN25wbJl3NndbouzhjG72OKl5zpaWyJqCgeGIcMx2MalTRI90D+03w0dAy
         uEnAVFQGo0vGUlpJbY0mksP5SHSj9UcVpz7bq4wGSaepU8SJHx2snEO3YO8qeVC7a7IQ
         hYoA==
X-Gm-Message-State: AOJu0YyUBWLy4iDU1eCzG9vMxwzMsIUZyqHvt6w+/9RoCldxGtVmMIqJ
	+FiNKpvxrfx3v9QqmsLkye9q5xtgnzhUoi1uZwbv0H0ddRNG01W2yrXcKz/q0wPn7fj2tSBf8E7
	tfsc=
X-Gm-Gg: AY/fxX4KubzQ2LD44FpYGQKtrq3pK1MvY2HeZwbwbK+DOvQFxtu9Rqqtya3qfAdoPlf
	q/zecFGnC0Cew3rECjsHq0KvUVZ8XNj4VF35M4iLT1t+chD+T2fu7BCKiEKewg8atMUthB/9DhQ
	6KNANk00A9Ad9/Int1x204Xr9cJi+uPoSr/YNjhxOf9MEhNvqr79G9EjNDLpXWwWS5HnOwXljj1
	r3vP+Tludkwcur5CoEIlsZvGgWf3/DCVuTwHNlirRKIwMS/P6YaXxoetmJG5DTl9j0Uhb5VADIu
	kHrAX5pRPjNB41c/xSP5uzviC+MnI8+RI8G+yG4Bbmcyf3Zp1GW9Ls51cvJa7ksV7J39UvUvoSp
	m0Kk1KMEl+CEe4mikUa21ZuM0FNOCGYdjwgjMvLwAHQh/3Wxrv227QKZrAmcH8wYLKHHdtaSfc8
	Sr
X-Google-Smtp-Source: AGHT+IFNJwXXFvaBnTpwKP6AZYRQh0lwH8F7YbftvdahaDo8UqQbxFC95d0ZemKyvgw8ArvqhenM5A==
X-Received: by 2002:a05:622a:149:b0:4f1:cd72:f22b with SMTP id d75a77b69052e-4ffb49f46d8mr256366141cf.52.1768228799404;
        Mon, 12 Jan 2026 06:39:59 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8e72f38sm123536331cf.34.2026.01.12.06.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:39:58 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] meta-arm/oeqa: ignore initrd warning in qemuarm64-secureboot
Date: Mon, 12 Jan 2026 09:29:35 -0500
Message-Id: <176822817491.4053833.10321989498624818685.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260106165915.1001317-1-ross.burton@arm.com>
References: <20260106165915.1001317-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Jan 2026 14:40:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6836


On Tue, 06 Jan 2026 16:59:14 +0000, Ross Burton wrote:
> With kernel 6.18 the kernel will now warn if it tries to run a command
> from a ramdisk but it cannot be found[1]. This happens with the
> qemuarm64-secureboot machine (but not qemuarm64) because u-boot appears
> to be populating the devicetree with a ramdisk entry:
> 
>     loading kernel to address 40400000 size 1702a00
>       1  qfw          ready   qfw          0  qfw
>     ** Booting bootflow 'qfw' with qfw
>     ## Flattened Device Tree blob at 7e659890
>        Booting using the fdt blob at 0x7e659890
>     Working FDT set to 7e659890
>        Loading Ramdisk to 7bcfd000, end 7d3ffa00 ... OK
>        Loading Device Tree to 000000007d621000, end 000000007d626534 ... OK
>     Working FDT set to 7d621000
> 
> [...]

Applied, thanks!

[1/2] meta-arm/oeqa: ignore initrd warning in qemuarm64-secureboot
      commit: 54d84b7900297cbe5e2f6cfa2aa63d6059246109
[2/2] meta-arm-bsp/oeqa: ignore new PCI warnings
      commit: d908c2bc5ff09d77747832299a3a22e9d1e39780

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

