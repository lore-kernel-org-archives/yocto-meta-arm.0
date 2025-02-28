Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D04DC19776
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 04:02:26 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.8464.1740715343963492430
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Feb 2025 20:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=0kPqCPf8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c0bb7328fbso189032985a.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 27 Feb 2025 20:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1740715343; x=1741320143; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuDCDzR37cR3crF8PJbVbVmR+eTdjKssKUzAtdko7i0=;
        b=0kPqCPf84gw84BImHlO2B7PgtwAxN4jpOJCxIOY3T1cQT0Jb2DoQx6+BSNzBLbzuz7
         q38/mqRDPVVT6ka0SLper9DgLzeBpBMNQ3r2vbDK9FQSPhoK6MR1/PnnYCLFBEizXeVF
         jjPLPTQsipGDgAKu71sjnztC0E6UVr1rbkcQm21uz8ggT3Nm2JvfT+tse7O4XxL4dudW
         nNth6CHR0+AFormH9ZcxAOpPZ4YdtkC5Gjv2u25G/5C4NjY4UFE+B/ajBMvLjbBcJXQp
         5yVbOLEyON6EwouWF40eRcHd95hCjj/x0DMuGqLqLDYRP7izJQOV/4YTRBIOZs0SM2Yn
         vQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740715343; x=1741320143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuDCDzR37cR3crF8PJbVbVmR+eTdjKssKUzAtdko7i0=;
        b=o7d3A4enAg+iLhTv99gac81azgXvtuOdogDtkwFIm4wFRwq6awEX9aUlZaHOIUnMbF
         K5QuLZpBGcV76I9ex8T73XZS3tdyJlOuwtsDzr5y327WjWMbp2SWopiOk5gHIRNC1UHa
         itAwByrIBOxYGJHqo3MTW5nm8kwS1qVSQlwxNQkSzCK0UTHeKTxWukXMN89hGWprts96
         zJYC71ZX5mgv4FUzuke2ENmcwYQon64XcehJM+K9XC39Y4sZBA2gMOd9bVHyJCT5Rhg5
         0uO0f2lX1vPesuwyrUM6zHQA3poywTF6aw2/hlqNxaB1E4L2O0rGi1Zpz80cpvaO3Q7s
         PjCw==
X-Gm-Message-State: AOJu0YypAzkAcuHXuAnLUwSa4nbLEITBs+LIla6GL4nM9MtwBLg3kQrx
	9+JQbeI3rqZxW5vLP+158NHa49oWuBrqJeT+lX/FM/D17IjqUeZJWgsmltJPkZlFhOj8jav9a7s
	=
X-Gm-Gg: ASbGnctSLC4/ECUa/t7kkipg99Mso3QCDeU5NytP/LAPDK+bLMGEbh7vY/iaHgO6lHH
	pRdezym5fTVH1GmjKxo/ftKgRUNpgvswvNs9ZCAq+XfqPvlQAfuzrEveij7ZT3XXaYi8SXl18o9
	PfFBiMyvHO4T5oN7hn8YWcNGa0xeMsgUw/qrJ4W/XZZ2yxEhEzejhDdAcNrKWQvUdxr8/kqhPV3
	OH6na02bm/d7KWbTS8Lu57olx76P9Zr7uA8Aew/T2+yWf/QFHTCrzgWS9ki8NBD8Zb4bQfC3h6B
	Bv76pA2pdTbWzaaqFg==
X-Google-Smtp-Source: AGHT+IFuC5BEOdAVeLa/ncQKWcyCY3Udag/hkt1X8iM7wypM72fR1GSj589zMK3/fIlmgApj+G1mnw==
X-Received: by 2002:a05:620a:4694:b0:7c0:ab46:394a with SMTP id af79cd13be357-7c39c4b7613mr241069385a.17.1740715342720;
        Thu, 27 Feb 2025 20:02:22 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e897633e6csm17844616d6.22.2025.02.27.20.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:02:22 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm/trusted-firmware-a: re-add patches
Date: Thu, 27 Feb 2025 23:02:15 -0500
Message-Id: <174071533789.3689039.13827564271802044982.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250224145112.71746-1-jon.mason@arm.com>
References: <20250224145112.71746-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Feb 2025 04:02:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6392


On Mon, 24 Feb 2025 09:51:10 -0500, Jon Mason wrote:
> TF-A Patches were erroneously moved to meta-arm-bsp, despite still being
> needed by the recipes in meta-arm.  Copy them back and make copious
> apologies.
> 
> 

Applied, thanks!

[1/3] arm/trusted-firmware-a: re-add patches
      (no commit info)
[2/3] arm/trusted-firmware-a: update git recipe
      (no commit info)
[3/3] arm/fvp-base-a-aem: update to 11.28.23
      commit: 1adc20650931b2599c05df51e56b5ad82c0a7876

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

