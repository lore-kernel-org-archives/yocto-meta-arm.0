Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E983FC10F16
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 15:08:19 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.15445.1714748891371945155
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 May 2024 08:08:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=yFPLPiaI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-790eedf44faso450863285a.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 03 May 2024 08:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714748890; x=1715353690; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7JTw+IDEwpFEIEe1ZSYC0z3vTs874pfiSI6Ncyxl+A=;
        b=yFPLPiaIKDv7pw1+k2eELGQ4Bnp8MM7OmEtKUyZxo0gvWD5iEZhDRqQqlY+X+d8G7N
         5fwHWEztGx7V59r8wm1IHg9cmy8cHaOoZts8AAQQeqgt0Tj3zgcHhKMzI91/Z7WZ3Uhr
         asa4sv6mEUXI7MWoSUctEqdteK15p189UUIBHJ1pGzGQ+mmIZg+O7t+2Xua2sC3x2u96
         H1bbLHigl7Nu1raT3klljbdPJ8RW8sn9/UShEW7B3VkKqKF2RT79+MoWe9au1lUrtqLW
         kBTKBBFseyTJl8SpLlXjFbBItyzJDLkVcxRlQjJPbhOrW7eWxlH75q9gifunmazjLWfK
         vubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714748890; x=1715353690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e7JTw+IDEwpFEIEe1ZSYC0z3vTs874pfiSI6Ncyxl+A=;
        b=iQy+bUBiFE4aV8j7Tr0BqFwDsLCesb662NUa4tZnhPa02Ja4+Qnn0yrNQRoDRG8K02
         0VpboohXPpdun10XQ10GK+Xfn4x/o9AAPIkpz+oUH5iC+Vj0kBwyNkpXWi0SeQyOvb34
         WKB78REm7XhGjbbqf0ujC2Wy38j87KKmx9+G6U6otd06uApYgtYB2onpPRMadOOboFFI
         k05XeH/VNfPOAiQp0in0mE7vNoNqvGhWqqK1YMW3LXAfdJ9iiMXkevX2BmRZQWxHoNpc
         NJZ/dFu+ZvPULrqyn0kWI+aXx8ZLRnLSSlvGqAFdnMlFZ45omJEbxSbcQDWIloS2bJrU
         zphg==
X-Gm-Message-State: AOJu0YzDirkVG9ZVo5TfJm+AQnrulTZNNmb/jU3EZbh3iRDthYTt0OPU
	tMhYX7uJnCyeQC7uH/dvVmuaMTPhPkOvtwGUztXwfpCUqpLf7YnAft9MIRnQYsGnjdqNgxnBkP4
	=
X-Google-Smtp-Source: AGHT+IEP1sIw2n5U3OJtwGYVYCpfnYkn1CuXw8W7j+AwuQdwbT2NTSLHlnVogoE60P/xZGbu3HqSqw==
X-Received: by 2002:a05:620a:72af:b0:790:a401:7a6d with SMTP id wd47-20020a05620a72af00b00790a4017a6dmr2784879qkn.14.1714748890248;
        Fri, 03 May 2024 08:08:10 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id bm34-20020a05620a19a200b0078ec3aa9cc7sm1309297qkb.25.2024.05.03.08.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 08:08:09 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: Re: [PATCH v3] arm/trusted-firmware-rmm: Add bitbake, include and patch file for RMM
Date: Fri,  3 May 2024 11:06:07 -0400
Message-Id: <171474876814.71176.1153461038431003938.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240405154850.1678802-1-mathieu.poirier@linaro.org>
References: <20240405154850.1678802-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 03 May 2024 15:08:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5694


On Fri, 05 Apr 2024 09:48:50 -0600, Mathieu Poirier wrote:
> Initial checking providing support for RMM on QEMU's "virt" machine.
> 
> 

Applied, thanks!

[1/1] arm/trusted-firmware-rmm: Add bitbake, include and patch file for RMM
      commit: e043bc48844b17686e2f189126f80f53706c4caf

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

