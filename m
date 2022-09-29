Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBF3C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 19:01:48 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.14236.1664478086473661072
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 12:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=hYl7HNL8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f174.google.com with SMTP id f26so1357751qto.11
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 12:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=pORcVfA07TXMZo6kKVsV+xYxZI9NsiX/2IE395H5dxs=;
        b=hYl7HNL8OlHvYEZlqmgdXdtSXiunfV6mBahDr1nfMbNGrCS2wWQI2J3pZ3DCsnUNr3
         RQEa1UVFosG3BnxzXjztId0C7vHCGvmPtOvn6MwIlQBo5bIoqPG6p5SQZlMTLAFFVfVH
         oRUfNR3GajKQ4NyR35Ri77UjZJhnBOZunMmKBbuPVxK1mcO/nyIU/Mx93uVGwhZ3M1JU
         y5fJjBfEMg2b/niRBTEx7x9wPXHsvWtbYXs/4nHSSvzt8R9Usvt2J5Crjxa16Zno10jU
         OvQsFOwmhquzxzZnJ0vttONHAC22V7O+/G8cjFqXIEoUrT3hLZwA2Adl5XMFb9mHiy9R
         PQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=pORcVfA07TXMZo6kKVsV+xYxZI9NsiX/2IE395H5dxs=;
        b=BDqzfiIcnRgkV6KJhqkW9fry+NX7qHavFMPzWyYJny58VB1jeT06vUM1NN1Ioq8CH4
         COs/iFa7m1QAWir3FdPCDLGSbkf9LEheuEGXA8ey9AWmw8VlQgJ1f3pSv58EQtRJVPXa
         0vEhTd/9fjZxp9uGHfDJAKOvms8RhzrvgdNBCgAFE96+0ngiS5nl3tglgCruhkzSFiJS
         HCV99JChgsXQ47Agm1WUsbkZVD1FCmVap/O1BtGja0FpVff8f5cm6xwMME0EVHX+/uJd
         iYoyY3JdhpS8wbqWd0v85VHuvSVH2vRJDknUJHKoUmrcGW8PXrsTfHaBOfv/JbhEcmYE
         jktA==
X-Gm-Message-State: ACrzQf2hXD1Hszwct09bKqnLN+c8fIairdpRIBuH2+mJb+U30tMWEiTi
	RjcTm57XAQPNQ/F7HrGzC8HvRRBXgWSQdrbL
X-Google-Smtp-Source: 
 AMsMyM6nk1ZGOKw/wOqgtd/75UC8VGUveGNQn6EKphIju5tgURzmHz60KD0Mc8j3hVfE+rFWsSNyKw==
X-Received: by 2002:ac8:5ac7:0:b0:35b:b658:4b6c with SMTP id
 d7-20020ac85ac7000000b0035bb6584b6cmr3710394qtd.207.1664478098993;
        Thu, 29 Sep 2022 12:01:38 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 c6-20020a05620a0ce600b006b9c6d590fasm143890qkj.61.2022.09.29.12.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 12:01:38 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] runfvp: pass-through environment variables need for GUI
 applications
Date: Thu, 29 Sep 2022 14:56:35 -0400
Message-Id: <166447779548.3284601.12566943913038000577.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220929095820.1066279-1-ross.burton@arm.com>
References: <20220929095820.1066279-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 29 Sep 2022 19:01:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3878

On Thu, 29 Sep 2022 10:58:20 +0100, Ross Burton wrote:
> Since 820a55d3 the environment that the FVPs run in is limited, however
> this broke the use of GUI applications for the terminals.
> 
> Passthrough DISPLAY and WAYLAND_DISPLAY automatically so these continue
> to work.

Applied, thanks!

[1/1] runfvp: pass-through environment variables need for GUI applications
      commit: aa89fe3f08cb8406f9f1082c683bd71cd04628fb

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

