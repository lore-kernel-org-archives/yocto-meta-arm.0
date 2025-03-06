Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1C8C28B24
	for <webhook@archiver.kernel.org>; Thu,  6 Mar 2025 15:41:23 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.16687.1741275675470727415
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Mar 2025 07:41:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=eHc3Kc6A;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-471fe5e0a80so6247771cf.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 06 Mar 2025 07:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1741275674; x=1741880474; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5VrOSacg6XKA6bsoOwlTkUolvvFwikr8HeU0e/atC8=;
        b=eHc3Kc6A4UjEkkVkHiuGBXHfr7o4vXb+D0Ta7ijbYEbbJDH3flSi0qIlZ/Vecj1DBL
         fWQ9WA5/M+rk69fyBMyqCVYmKLvYzm9Ir0FdFbamlKJpofbjLFdheXuKv4+sZfmaLA2j
         OF2VX7suP0k5CTF6iVFgJmp0ZzPwLflnWaqj+rSlRLPzT3deYx43eqIEZ3ZnWwfL72no
         hA1GO3joRvkxNtwXL4Z50M+Usn0iDxTz+S9LUk+oAtOxXRweOBbrGoOSmA3JVIj11856
         Y61+ouoxeAmPJByBX4+pYx83E0/ZsrCuKTzIt5YtrjdBMP2t2V/hiqy7YlwQ+eKlOuMt
         DDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741275674; x=1741880474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5VrOSacg6XKA6bsoOwlTkUolvvFwikr8HeU0e/atC8=;
        b=twvDPTZiAqWIrTfCc+KZuMewj+4taqiAyiAmiDHtMkwt0vnGbbsHJZbY5NfgriKQT4
         9GHXWTkgTxAp68Gr6qgt4o9HKgy2vRKuJ9/vD1+3ugGpv6AAJ175aHFFdnhJX58OKFId
         aW0a8fSYbP57jskKfHL4/7KLUjUDORztWv7K193Xu5hZGVeG3UBK+6J5A29pRGKECfMf
         6cpeaXYEWPjA0aut0Q70z7OC+VWDVs6O3AHDwRFrtYTJ6bDNO3O+giOBhll8UGtd9uu/
         4aINk5SzbnIimZQ93rJU0xob58Mdwn80oW4z1DjOd36JU0m66bQEQws042YhLneyiSkF
         oP4g==
X-Gm-Message-State: AOJu0YyryYaCC1mKdfXfKHtGJQu0M8SfhctWyzXnNewPxoO3liPAyGfZ
	dDFxC83CjzikX2wUp1qiCMmSkhbb8OAACytYhoxJJu+4rAHldB3pu4TuaevOwdB33Mhsp+vJh7I
	=
X-Gm-Gg: ASbGncvHpa/Yr5bOmbiekjVCn7TGesQGWJg3e3ghvHS6z52mZS8Cjqzooz2FuhpGFb1
	lFsT559Z2KHYZJjquOOTXnylr4fPkH7S4ltnV7fL6Kthc+sev76h8E7HEIWwe2QCD+/sCIx9dQH
	+0YvZVrABTVBXjZi0/guEzfWD99IJ3h0XgxT2fkJWKE2ov/OV9PPIIxlfvcghKn4Fn6MtfoxB1o
	pcaUMMPJDQzaGQ1FEZcM0OWWh+gOkBU5oQv7AlkXC+Nl6PUzPzvGSQclTlaTRF+EI9blLj89CaO
	63rR/Ad4KWYySCPC0NL7kFhjLw7dj/H895YS
X-Google-Smtp-Source: AGHT+IGQqzsiO2WfuRoBNysTO+rU2L+dCU/E37ii9WvYkRXSk9jl+gFmMaHP6XiwZ3PLBbbXjHSPyw==
X-Received: by 2002:ad4:5cc1:0:b0:6e8:f945:ec5 with SMTP id 6a1803df08f44-6e8f9451055mr23051646d6.24.1741275674016;
        Thu, 06 Mar 2025 07:41:14 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8f7170958sm8300036d6.108.2025.03.06.07.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 07:41:13 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH] arm/trusted-services: ts-sp-fw: Replace v2.7.0 tag with commit ID
Date: Thu,  6 Mar 2025 10:41:08 -0500
Message-Id: <174127566894.1840683.2086921537290795213.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250228054834.3224744-1-andrew@codeconstruct.com.au>
References: <20250228054834.3224744-1-andrew@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Mar 2025 15:41:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6397


On Fri, 28 Feb 2025 16:18:34 +1030, Andrew Jeffery wrote:
> Do so for the usual reason of avoiding network access during recipe
> parsing. Occasionally parsing will stall for me as it seems connectivity
> to trustedfirmware.org can be flaky.
> 
> 

Applied, thanks!

[1/1] arm/trusted-services: ts-sp-fw: Replace v2.7.0 tag with commit ID
      commit: f9f47ec15a1f9d36f25d9e49ea1d1a2e9903eeab

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

