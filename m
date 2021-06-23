Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1504.1624476151938035280
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Jun 2021 12:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4C26340C53;
	Wed, 23 Jun 2021 19:22:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LaNBKmLGfxJx; Wed, 23 Jun 2021 19:22:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2B266409E0;
	Wed, 23 Jun 2021 19:22:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DC062174612; Wed, 23 Jun 2021 15:22:29 -0400 (EDT)
Date: Wed, 23 Jun 2021 15:22:29 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH][hardknott 3/3] ci: add yocto-check-layers step
Message-ID: <20210623192228.GK1528@denix.org>
References: <20210623122814.1467189-1-ross.burton@arm.com>
 <20210623122814.1467189-3-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210623122814.1467189-3-ross.burton@arm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ross,

Thanks! Do you need these changes on dunfell as well?


On Wed, Jun 23, 2021 at 01:28:14PM +0100, Ross Burton wrote:
> Add a job to run yocto-check-layers to validate a selection of layers
> are Yocto Project Compatible.
> 
> Right now we validate:
> - meta-arm
> - meta-arm-bsp
> - meta-arm-toolchain
> - meta-gem5
> 
> meta-atp and meta-arm-autonomy are currently skipped: meta-atp fails and
> meta-arm-autonomy has a larger set of dependant layers and will be added
> later.
> 
> Change-Id: Ia0c8c16e4228eeb461bd213b30703e950ede656f
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .gitlab-ci.yml      |  8 ++++++++
>  ci/check-layers.py  | 43 +++++++++++++++++++++++++++++++++++++++++++
>  ci/check-layers.yml |  7 +++++++
>  3 files changed, 58 insertions(+)
>  create mode 100755 ci/check-layers.py
>  create mode 100644 ci/check-layers.yml
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index b97d106..7ad141f 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -71,6 +71,14 @@ machine-coverage:
>  # Build stage, the actual build jobs
>  #
>  
> +# Validate layers are Yocto Project Compatible
> +check-layers:
> +  extends: .setup
> +  coverage: '/Coverage: \d+/'
> +  script:
> +  - kas shell --update --force-checkout ci/base.yml:ci/meta-python.yml --command \
> +    "$CI_PROJECT_DIR/ci/check-layers.py $CI_PROJECT_DIR/ci/check-layers.yml $CI_PROJECT_DIR $KAS_WORK_DIR"
> +
>  corstone500:
>    extends: .build
>  
> diff --git a/ci/check-layers.py b/ci/check-layers.py
> new file mode 100755
> index 0000000..7b607ae
> --- /dev/null
> +++ b/ci/check-layers.py
> @@ -0,0 +1,43 @@
> +#! /usr/bin/env python3
> +
> +import argparse
> +import pathlib
> +import re
> +import subprocess
> +import sys
> +
> +import yaml
> +
> +if __name__ == "__main__":
> +    parser = argparse.ArgumentParser()
> +    parser.add_argument("config", type=argparse.FileType())
> +    parser.add_argument("metaarm", type=pathlib.Path, help="Path to meta-arm")
> +    parser.add_argument("others", type=pathlib.Path, help="Path to parent of dependencies")
> +    args = parser.parse_args()
> +
> +    config = yaml.safe_load(args.config)
> +    layers = config["layers"]
> +    dependencies = config["dependencies"]
> +
> +    found_layers = [p for p in args.metaarm.glob("meta-*") if p.is_dir()]
> +    print(f"Testing {len(layers)} layers: {', '.join(layers)}.")
> +    print(f"Found {len(found_layers)} layers in meta-arm.")
> +    print()
> +
> +    cli = ["yocto-check-layer-wrapper",]
> +    cli.extend([args.metaarm / layer for layer in layers])
> +    cli.append("--dependency")
> +    cli.extend([args.others / layer for layer in dependencies])
> +
> +    passed = 0
> +    process = subprocess.Popen(cli, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, universal_newlines=True)
> +    while True:
> +        line = process.stdout.readline()
> +        if process.poll() is not None:
> +            break
> +        print(line.strip())
> +        if re.search(r"meta-.+ PASS", line):
> +            passed += 1
> +
> +    print(f"Coverage: {int(passed / len(found_layers) * 100)}%")
> +    sys.exit(process.returncode)
> diff --git a/ci/check-layers.yml b/ci/check-layers.yml
> new file mode 100644
> index 0000000..7d2820c
> --- /dev/null
> +++ b/ci/check-layers.yml
> @@ -0,0 +1,7 @@
> +layers:
> +  - meta-arm
> +  - meta-arm-bsp
> +  - meta-arm-toolchain
> +  - meta-gem5
> +dependencies:
> +  - meta-openembedded/meta-oe
> -- 
> 2.25.1
> 
