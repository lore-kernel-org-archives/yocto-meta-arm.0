Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDC0C46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 10:50:24 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.100755.1673347814727112463
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Jan 2023 02:50:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 077EB4B3;
	Tue, 10 Jan 2023 02:50:56 -0800 (PST)
Received: from [10.1.199.64] (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A007F3F587;
	Tue, 10 Jan 2023 02:50:13 -0800 (PST)
Message-ID: <c03d0df5-9cab-74a6-195f-699704c67030@arm.com>
Date: Tue, 10 Jan 2023 10:49:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] arm/classes: Ensure patch files are sorted in
 apply_local_src_patches
To: meta-arm@lists.yoctoproject.org
Cc: Diego.Sueiro@arm.com
References: <20230110104536.686539-1-peter.hoyes@arm.com>
Content-Language: en-US
From: Peter Hoyes <Peter.Hoyes@arm.com>
In-Reply-To: <20230110104536.686539-1-peter.hoyes@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Jan 2023 10:50:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4249

On 10/01/2023 10:45, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
>
> apply_local_src_patches.bbclass was added in a previous patch to handle
> the application of patch files located inside the fetched source code.
>
> find is used to collect the patch files which does not guarantee the
> order of its output. Pipe the output of find into sort to ensure patch
> files are applied in the correct order.
>
> Issue-Id: SCM-5864
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: I1082fb7a726a7745289a5aa8bb6447bef57a94b0

Please can this patch be backported to langdale.

Thanks, Peter

> ---
>   meta-arm/classes/apply_local_src_patches.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arm/classes/apply_local_src_patches.bbclass b/meta-arm/classes/apply_local_src_patches.bbclass
> index daa85f4c..e1939353 100644
> --- a/meta-arm/classes/apply_local_src_patches.bbclass
> +++ b/meta-arm/classes/apply_local_src_patches.bbclass
> @@ -32,7 +32,7 @@ apply_local_src_patches() {
>       export QUILT_PATCHES=./patches-extra
>       mkdir -p patches-extra
>   
> -    for patch in $(find $input_dir -type f -name *.patch -or -name *.diff)
> +    for patch in $(find $input_dir -type f -name *.patch -or -name *.diff | sort)
>       do
>           patch_basename=`basename $patch`
>           if ! quilt applied $patch_basename >/dev/null ; then

