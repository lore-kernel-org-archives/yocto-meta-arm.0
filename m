Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0FEC05027
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 21:29:43 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.429.1676237378774179531
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 12 Feb 2023 13:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=TLegxNjb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id g18so11980953qtb.6
        for <meta-arm@lists.yoctoproject.org>; Sun, 12 Feb 2023 13:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=buwwuKXfPW6S26Wvp1+ZQQ+lk5hEzlb6+XPMfozJ5Ac=;
        b=TLegxNjbad1tqgym7ZL+TVQgcwFqTE8KP+cx7pUxRKaxdigoB+DTR9WpTWeO43BuAu
         LMaYxVXyTSbs3ZpmQRXYF+xGBjkfI3u96J0ZSdJvUqcc931UW9xHzuZxkDEcvm/MEQ9w
         MsmxaGgLT4BdO7aXjFSt6r/FUFa2/BQdjJzLxXnGXmGqr2rUd5XfLFJJBc18s4Wfm8xu
         aEmilhY5nL0+Xptmg3geL8SKe2DLc+BhdxJk4FTiRHsXr+v3jdtKzsups9BzYDBeD5UV
         oQC/81bNMdB+2NYqa5GM06QxlXtf8a2KpmIpInFj0lW2xkCveVvnr+lntqEqPn/ByC/z
         NP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=buwwuKXfPW6S26Wvp1+ZQQ+lk5hEzlb6+XPMfozJ5Ac=;
        b=7kuioSjdfYGG17smXZJ2linoaDqnhatYaZzyRzeWG2i86jfxct12KE+AhnNUr5NGRf
         7kFopkHMX/sw++Yv1tjVUC2dou9nEOiStTbPyIFlAV5p3Hr2jVWE6Z4baYyvFX0wTg1T
         jkRR3X+lftVn0nLpIFbCP/r8HE2MzVn3w+08UPU6hGmqf3GtPi+OmpiQQj6SGviWi3Ia
         baIZO8pWzCZkYQdaM4tSFuoTP6uMT+4RryfEXkgHj8nmwBBbrDhevkpgB+10Tf6Hvvp5
         ebLIY1mvXW/dx3RMrVa2mQy14jfYr1Xfroo0FnIzJRBZ1yHwAAaA7ujfcA1uNrPXEZMa
         P4nw==
X-Gm-Message-State: AO0yUKU4ae/J/C6Emgy4zsM+5i5x8/J5ZCJZhjuakbKhOzkvAWseZeOb
	AUCoDkXZl9qzVVOc+ZlA84HgDcWZHl7FDI3d
X-Google-Smtp-Source: AK7set/MqU8ULuRP1SP9VmJgHEDrxFVtRD1S5r/SoxWD+CLLbWDQuEy/Xjh9eK52Pf2O22WJs5n1pw==
X-Received: by 2002:ac8:5ac7:0:b0:3b8:682d:cebf with SMTP id d7-20020ac85ac7000000b003b8682dcebfmr36897627qtd.66.1676237377443;
        Sun, 12 Feb 2023 13:29:37 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id s63-20020a37a942000000b0071c9eea2056sm8457855qke.14.2023.02.12.13.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 13:29:36 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH langdale 0/1] arm/trusted-firmware-m: Do not use release branches
Date: Sun, 12 Feb 2023 16:29:29 -0500
Message-Id: <167623737072.3515638.16994722391610211179.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230209120456.26364-1-emekcan.aras@arm.com>
References: <20230209120456.26364-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 12 Feb 2023 21:29:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4383

On Thu, 9 Feb 2023 12:04:55 +0000, emekcan.aras@arm.com wrote:
> TFM repos do not use release branches. TFM-test repo does not use master
> branch and use detached head for the 1.6 release. This commits makes necessary
> changes to be able to build tfm and tfm-test again for langdale.
> 
> Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
> 
> Emekcan Aras (1):
>   arm/trusted-firmware-m: Do not use release branches
> 
> [...]

Applied, thanks!

[1/1] arm/trusted-firmware-m: Do not use release branches
      commit: 4ec5d8b306e84f929188e038b330c01d68dabd3b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

