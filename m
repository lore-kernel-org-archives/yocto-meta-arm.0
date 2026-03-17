Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD13DFD8769
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 13:14:19 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75653.1773753249819170288
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 06:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=m3SM7wxU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89c4f7f8650so34452636d6.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Mar 2026 06:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1773753249; x=1774358049; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+/Ur311Wug4eatnr1ConIFJkwevdaDXjYmqsw+C3D0=;
        b=m3SM7wxUAjM7RwSS+cBSvzoCae2m9NTvVji/jokKCVGM3Un1S6OfuGfq0hXF50/EEK
         oO5dNgPGUSAMuYUhqoxkIJ7WZZzPPcJochP+ATxH88VbCKre8q1gHnC30QxJ+hxziZaP
         j22LSRkUnzeLZoK7Vptf/kr2kgEaQ/o19yccBysg3uMDwP2k23zeUijJN6cvGKIh4ieq
         5SbNN371BeZYhDKmbEj4NvUbEx3aV90aBx+TK2ARlLCu74Z/mIyb+YjIr3Fyn7JOA8jV
         j2heclJ0D2ZiYYy/Jl4w9KWz6l0UFYTnnGD7kT9o4NqgsGIJyT2AJWhOLknbHGp0yzs7
         r7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773753249; x=1774358049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6+/Ur311Wug4eatnr1ConIFJkwevdaDXjYmqsw+C3D0=;
        b=Sclbcm1gkM2S8Yfg8AViHLJNJL5r/gNbqhm6Rw+//MdiDVeCF+svrv2qL9Qx5RajpS
         UKyZ2xu/N8M9upRAgzoYZD1dKOwBTy6rAnpLqwHpXZd5Go2H+UUlWO3yO6ZB2TsRsEcB
         N+iF5a1BZyJ+0kjtMJgHEYiSRL2q9xZP8859Dfa6NE6dJMeEAqf2iBgEQZsVwlI3JY94
         SlrNEzU209xsD69/+itVGzyRMBTt2r8t68V343OpXJKYzRP51C34qGWsHNRFlc75p9MR
         Ubeu5sq+jpIQ+4Lcj+cplyJQ3nLuoUW97JVi2ct3o9RJe6Xze4yzAAjbFJ4Hi5EbA6sr
         Ecnw==
X-Gm-Message-State: AOJu0Yy7YWEVh5o7lyWM0t/cy+TWYVggRVEVvf5zrJMHn6BYoqACQfxs
	10fxof6G0dFb00ZvAYf5SxOS6lLWtrUDbexFhvmrU8n2/5wbz2kNHxKGdPG3nBbafQ6cYaOHfDQ
	UT7Y=
X-Gm-Gg: ATEYQzxBPXL0s2sh0rQEDiH2MWNi2c81miJyqZaPDjku+I9suO48+reYHXdLLaQ7U9D
	arFCEleS5gje6/8oNZB6eeqxqHazybmLim8yz5eQ4jUC+JIeRQmJiFapSt1TbLhG5wOLpmJMcrX
	LP2uj2F8DvSjpBvOA1pZ8ZzeQpAAWIQFoaiy0ZiwcyzXPI9wyXbw7mkbjf6D2/u89v+WHud9Ptg
	dsm+6t5dAAYAQsc/eJVYMj9MKZ9Y5j4mYauySzzEDL3wWAwsYyoJq+BMf9c4GM3RDJ07tslpLyb
	vmizEsIGKaLbS+SH9TV/5Y0TzV0IFQSxpGe4akn5BZDZxt1ahMjeRYTdcELviGQ7R1MPElD6neX
	68wkzh4MehXUmw2U1y8HuOyL0c1s6QPH6kpn8W37GlxqFnvC4yP5QyNQZHkB7U+Tvw2DDtjdHd/
	93EIFy4MvBv9Tg
X-Received: by 2002:ad4:596a:0:b0:89a:3c4:5161 with SMTP id 6a1803df08f44-89a8205b4d9mr270452776d6.59.1773753248414;
        Tue, 17 Mar 2026 06:14:08 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c46e33e82sm76120626d6.39.2026.03.17.06.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 06:14:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] CI: remove last traces of TOOLCHAIN_DIR
Date: Tue, 17 Mar 2026 09:14:00 -0400
Message-Id: <177375324031.1764585.10223864702582712417.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260313132100.1603643-1-ross.burton@arm.com>
References: <20260313132100.1603643-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Mar 2026 13:14:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6955


On Fri, 13 Mar 2026 13:20:59 +0000, Ross Burton wrote:
> When the binary toolchain support was removed[1] we no longer used this
> variable, but a few instances of it was left behind.
> 
> [1] meta-arm 03af0c72f1 ("arm-toolchain: remove external-arm-toolchain")
> 
> 

Applied, thanks!

[1/2] CI: remove last traces of TOOLCHAIN_DIR
      commit: 2f6824ddca3cd5eb46eb977e1875351fbfb25cf0
[2/2] CI: allow hashserver to be specified in environment
      commit: df572b4d534c9ab61ca051c937e1fbbc3120cdb4

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

